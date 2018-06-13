//
//  SecondViewController.h
//  W2D3-Segue
//
//  Created by Jason Liang on 6/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property(nonatomic, strong) NSString *text;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
