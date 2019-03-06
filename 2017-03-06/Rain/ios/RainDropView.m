//
//  RainDropView.m
//  EmojiRain
//
//  Created by Jason Liang on 2019-03-05.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

#import "RainDropView.h"

@implementation RainDropView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        self.text = @"😍";
        self.font = [UIFont systemFontOfSize:80];
        [self sizeToFit];
        CGPoint center = self.center;
        CGFloat length = MAX(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.bounds = CGRectMake(0, 0, length, length);
        self.center = center;
        self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
//        [self addSubview:label];
    }
    return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
  self.layer.masksToBounds = YES;
  self.backgroundColor = [UIColor redColor];
}

- (UIDynamicItemCollisionBoundsType) collisionBoundsType {
    return UIDynamicItemCollisionBoundsTypeEllipse;
}

@end
