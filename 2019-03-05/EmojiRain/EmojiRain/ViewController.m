//
//  ViewController.m
//  EmojiRain
//
//  Created by Jason Liang on 2019-03-05.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "RainView.h"
#include <stdlib.h>

@interface ViewController ()

@property (nonatomic) RainView *rainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rainView = [[RainView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.rainView];
    [self.rainView loadRain];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.rainView startRain];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.rainView stopRain];
}


@end
