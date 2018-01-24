//
//  FirstViewController.m
//  W2D3
//
//  Created by Jason Liang on 1/24/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *anotherview = [[UIView alloc] init];
//    anotherview.backgroundColor = [UIColor redColor];
//    [self.view addSubview:anotherview];
    
    UINib *customViewNib = [UINib nibWithNibName:@"CustomView" bundle:[NSBundle mainBundle]];
    
    NSArray *views = [customViewNib instantiateWithOwner:self options:nil];
    
    UIView *customView = [views firstObject];
    if (customView) {
        [self.view addSubview:customView];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonTapped:(id)sender {
}
@end
