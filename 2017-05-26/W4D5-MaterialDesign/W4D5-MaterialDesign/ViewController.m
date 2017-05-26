//
//  ViewController.m
//  W4D5-MaterialDesign
//
//  Created by Jason Liang on 5/26/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "MaterialButtons.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MDCButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  MDCRaisedButton *raisedButton = [MDCRaisedButton new];
  [raisedButton setTitle:@"Raised Button" forState:UIControlStateNormal];
  [raisedButton sizeToFit];
  [raisedButton addTarget:self
                   action:@selector(tapped:)
         forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:raisedButton];
  
  [self.button2 setElevation:10 forState:UIControlStateNormal];
  
  NSString *catURL = @"https://cdn.pixabay.com/photo/2014/03/29/09/17/cat-300572_960_720.jpg";
  
  NSString *dogURL = @"http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg";
  
  [self.imageView sd_setImageWithURL:[NSURL URLWithString:dogURL]
               placeholderImage:[UIImage imageNamed:@"ic_alarm_black_24dp"]
                        options:SDWebImageRefreshCached];
  
}

- (void)tapped:(id)sender {
  NSLog(@"Button was tapped!");
}

@end
