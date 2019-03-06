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
@end

@implementation RainView

- (void)loadRain {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    
    self.collisonBehavior = [[UICollisionBehavior alloc] init];
    [self.collisonBehavior addBoundaryWithIdentifier:@"bottom" fromPoint:CGPointMake(0, CGRectGetMaxY(self.bounds)) toPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds) - 100)];
    
    UIBezierPath *outsideBoundaryPath = [UIBezierPath bezierPathWithRect:CGRectInset(self.bounds, -100, -100)];
    self.boundaryIdentifier = @"disappear";
    [self.collisonBehavior addBoundaryWithIdentifier:self.boundaryIdentifier forPath:outsideBoundaryPath];
    
    self.collisonBehavior.collisionDelegate = self;
    
    [self.animator addBehavior:self.collisonBehavior];
    
    [self.animator addBehavior:self.gravityBehavior];
    self.views = [@[] mutableCopy];
    
    self.motionQueue = [[NSOperationQueue alloc] init];
    [self setupMotionManagement];
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
    UIView *v = [[RainDropView alloc] initWithFrame:frame];
    v.layer.cornerRadius = CGRectGetWidth(frame) / 2;
    [self.views addObject:v];
    [self addSubview:v];
    [self.collisonBehavior addItem:v];
    [self.gravityBehavior addItem:v];
}

- (void)removeItem:(id <UIDynamicItem>)item {
    [self.views removeObject:item];
    [self.collisonBehavior removeItem:item];
    [self.gravityBehavior removeItem:item];
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
- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier {
    if (identifier == self.boundaryIdentifier) {
        [self removeItem:item];
    }
}

@end
