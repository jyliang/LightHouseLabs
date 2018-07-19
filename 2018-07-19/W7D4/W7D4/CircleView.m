//
//  CircleView.m
//  W7D4
//
//  Created by Jason Liang on 7/19/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self configure];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self configure];
  }
  return self;
}

- (instancetype)init {
  return [self initWithFrame:CGRectZero];
}

- (void)configure {
  self.translatesAutoresizingMaskIntoConstraints = false;
  
  // create shape layer for circle
  
  self.shapeLayer = [CAShapeLayer layer];
  self.shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
  self.shapeLayer.fillColor = [[[UIColor blueColor] colorWithAlphaComponent:0.5] CGColor];
  self.lineWidth = 3;
  [self.layer addSublayer:self.shapeLayer];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  // path of shape layer is with respect to center of the `bounds`
  
  CGPoint center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, self.bounds.origin.y + self.bounds.size.height / 2);
  self.shapeLayer.path = [[self circularPathWithLineWidth:self.lineWidth center:center] CGPath];
}

- (UIDynamicItemCollisionBoundsType)collisionBoundsType {
  return UIDynamicItemCollisionBoundsTypePath;
}

- (UIBezierPath *)collisionBoundingPath {
  // path of collision bounding path is with respect to center of the dynamic item, so center of this path will be CGPointZero
  
  return [self circularPathWithLineWidth:0 center:CGPointZero];
}

- (UIBezierPath *)circularPathWithLineWidth:(CGFloat)lineWidth center:(CGPoint)center {
  CGFloat radius = (MIN(self.bounds.size.width, self.bounds.size.height) - self.lineWidth) / 2;
  return [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:true];
}

@end
