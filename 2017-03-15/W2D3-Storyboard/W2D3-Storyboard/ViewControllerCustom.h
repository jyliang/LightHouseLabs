//
//  ViewControllerCustom.h
//  W2D3-Storyboard
//
//  Created by Jason Liang on 3/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerCustomDelegate <NSObject>

- (void)printResult;

@end

@interface ViewControllerCustom : UIViewController

@property (nonatomic, strong) NSString *text;
@property (nonatomic, weak) id<ViewControllerCustomDelegate> delegate;

@end
