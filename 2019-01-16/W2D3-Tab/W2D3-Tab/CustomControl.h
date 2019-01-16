//
//  CustomControl.h
//  W2D3-Tab
//
//  Created by Jason Liang on 1/16/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomControl : NSObject
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentConrol;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

NS_ASSUME_NONNULL_END
