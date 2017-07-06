//
//  MainTabBarViewController.m
//  W2D4-NotificationCenter
//
//  Created by Jason Liang on 7/6/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "UserInfoObject.h"

@interface MainTabBarViewController ()

@property(nonatomic) UserInfoObject *userInfo;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.userInfo = [[UserInfoObject alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//  segue.destinationViewController
  
  // if it's first /second viewcontroller
  // pass in the userinfo
  
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
