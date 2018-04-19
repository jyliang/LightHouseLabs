//
//  SecondViewController.m
//  W2D4
//
//  Created by Jason Liang on 4/19/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tappedView:(UITapGestureRecognizer *)tapGesture {
    
    NSLog(@"tapped");
}

- (IBAction)handleRotation:(UIRotationGestureRecognizer *)rotationGesture {
//    rotationGesture.rotation
//    CGAffineTransform
    
    self.view.transform =
    CGAffineTransformRotate(CGAffineTransformIdentity, rotationGesture.rotation);
    NSLog(@"tapped");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
