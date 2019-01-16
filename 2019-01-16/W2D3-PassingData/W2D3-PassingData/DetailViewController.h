//
//  DetailViewController.h
//  W2D3-PassingData
//
//  Created by Jason Liang on 1/16/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

// store data
@property (nonatomic) NSString *textInfo;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

NS_ASSUME_NONNULL_END
