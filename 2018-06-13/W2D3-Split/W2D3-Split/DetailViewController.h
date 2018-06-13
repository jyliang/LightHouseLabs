//
//  DetailViewController.h
//  W2D3-Split
//
//  Created by Jason Liang on 6/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

