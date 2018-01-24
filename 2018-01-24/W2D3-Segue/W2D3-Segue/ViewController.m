//
//  ViewController.m
//  W2D3-Segue
//
//  Created by Jason Liang on 1/24/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import "ViewController.h"
#import "LabelViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"SEGUE MASTER";
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

// part of layout
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (IBAction)showLargeLabel:(id)sender {
    [self performSegueWithIdentifier:@"showlabel" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"showlabel"]) {
        return self.textField.text.length > 0;
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // method 1
    if ([segue.identifier isEqualToString:@"showlabel"]) {
        LabelViewController *vc = segue.destinationViewController;
        vc.text = self.textField.text; // passing data
    }
    
    // method 2
    if ([segue.destinationViewController isKindOfClass:[LabelViewController class]]) {
        LabelViewController *vc = segue.destinationViewController;
        vc.text = self.textField.text;
    }
    
    // method 3 - combine both
}

- (void)dealloc {
    
}

@end
