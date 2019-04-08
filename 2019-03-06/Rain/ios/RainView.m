//
//  RainView.m
//  EmojiRain
//
//  Created by Jason Liang on 2019-03-05.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

#import "RainView.h"
#import "RainDropView.h"
#import <CoreMotion/CoreMotion.h>

@interface RainView() <UICollisionBehaviorDelegate>

@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravityBehavior;
@property (nonatomic) UICollisionBehavior *collisonBehavior;
@property (nonatomic) NSMutableArray *views;
@property (nonatomic) CMMotionManager *motionManager;
@property (nonatomic) NSOperationQueue *motionQueue;
@property (nonatomic) id <NSCopying> boundaryIdentifier;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) CGRect previousBounds;
@property (nonatomic) UIDynamicItemBehavior *itemBehavior;
@end

@implementation RainView

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.boundaryIdentifier = @"disappear";
    self.previousBounds = CGRectZero;
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    self.collisonBehavior = [[UICollisionBehavior alloc] init];
    self.collisonBehavior.collisionDelegate = self;
    [self.animator addBehavior:self.collisonBehavior];
    [self.animator addBehavior:self.gravityBehavior];
    self.itemBehavior = [[UIDynamicItemBehavior alloc] init];
    self.itemBehavior.elasticity = 1;
    self.views = [@[] mutableCopy];
    self.motionQueue = [[NSOperationQueue alloc] init];
    [self setupMotionManagement];
  }
  return self;
}

- (void)didMoveToSuperview {
  if (self.superview) {
    [self resizeCollisonBehavior];
    [self stopRain];
    [self startRain];
  }
}

- (void)layoutSubviews {
  [super layoutSubviews];
  if (CGRectEqualToRect(self.bounds, self.previousBounds)) {
    return;
  }
  self.previousBounds = self.bounds;
  [self resizeCollisonBehavior];
}

- (void)resizeCollisonBehavior {
  NSArray *items = [self.views copy];
  for (UIView *item in items) {
    [self removeItem:item];
  }
  [self.collisonBehavior removeAllBoundaries];
  [self.collisonBehavior addBoundaryWithIdentifier:@"bottom" fromPoint:CGPointMake(0, CGRectGetMaxY(self.bounds)) toPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds))];
  
  UIBezierPath *outsideBoundaryPath = [UIBezierPath bezierPathWithRect:CGRectInset(self.bounds, -100, -100)];
  [self.collisonBehavior addBoundaryWithIdentifier:self.boundaryIdentifier forPath:outsideBoundaryPath];
  
}

- (void)setupMotionManagement {
  self.motionManager = [[CMMotionManager alloc] init];
  __weak RainView *weakSelf = self;
  [self.motionManager startDeviceMotionUpdatesToQueue:self.motionQueue withHandler:^(CMDeviceMotion *motion, NSError *error) {
    CMAcceleration gravity = motion.gravity;
    dispatch_async(dispatch_get_main_queue(), ^{
      weakSelf.gravityBehavior.gravityDirection = CGVectorMake(gravity.x, -gravity.y);
    });
  }];
}

- (void)createItemWithFrame:(CGRect)frame {
  if (self.views.count > 50) {
    return;
  }
  UIView *v = [[RainDropView alloc] initWithFrame:frame];
  v.layer.cornerRadius = CGRectGetWidth(frame) / 2;
  [self.views addObject:v];
  [self addSubview:v];
  [self.collisonBehavior addItem:v];
  [self.gravityBehavior addItem:v];
  [self.itemBehavior addItem:v];
}

- (void)removeItem:(id <UIDynamicItem>)item {
  [self.views removeObject:item];
  [self.collisonBehavior removeItem:item];
  [self.gravityBehavior removeItem:item];
  [self.itemBehavior removeItem:item];
  if ([item isKindOfClass:[UIView class]]) {
    UIView *v = (UIView *)item;
    [v removeFromSuperview];
  }
}

- (void)addDrop {
  int x = arc4random_uniform(CGRectGetWidth(self.bounds));
  int y = arc4random_uniform(50);
  [self createItemWithFrame:CGRectMake(x, -y, 50, 50)];
}


- (void)startRain {
  [self stopRain];
  __weak RainView *weakSelf = self;
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
    [weakSelf addDrop];
  }];
  [self.timer fire];
}

- (void)stopRain {
  [self.timer invalidate];
  self.timer = nil;
}

#pragma mark - CollisionDelegate
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
  if (identifier == self.boundaryIdentifier) {
    [self removeItem:item];
  }
}

@end
