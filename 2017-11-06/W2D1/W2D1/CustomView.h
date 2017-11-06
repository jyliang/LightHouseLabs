//
//  CustomView.h
//  W2D1
//
//  Created by Jason Liang on 11/6/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coffee.h"

@interface CustomView : UIView

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) UILabel *subtitleLabel;
@property(nonatomic) UITextField *textField;

- (void)configWithCoffee:(Coffee *)coffee;

@end
