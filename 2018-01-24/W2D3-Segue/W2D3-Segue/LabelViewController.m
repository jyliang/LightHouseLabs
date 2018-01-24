//
//  LabelViewController.m
//  W2D3-Segue
//
//  Created by Jason Liang on 1/24/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = self.text;
    self.title = @"LARGE LABEL";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
