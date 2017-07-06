//
//  FirstViewController.m
//  W2D4-NotificationCenter
//
//  Created by Jason Liang on 7/6/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) NSString *text;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *pointView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.text = @"";
  [self addTextFieldObserver];
  
  [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
  [self.button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTapped {

}

- (void)buttonTapped:(id)sender {
  
}

- (IBAction)sliderValueChanged:(id)sender {
  UISlider *slider = sender;
  NSLog(@"%f", slider.value);
  
}

- (void)addTextFieldObserver {
  //  self.textField.text
  [self addObserver:self
                   forKeyPath:@"text"
                      options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial)
                      context:(void*)@"type1"];
  
  [self.textField addTarget:self
                action:@selector(textFieldDidChange)
      forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange {
  self.text = self.textField.text;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  NSLog(@"%@%@%@%@", keyPath, object, change, context);
  self.label.text = change[@"new"];
}



//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{




- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender {
  NSNotificationCenter *ns = [NSNotificationCenter defaultCenter];
  
  NSDictionary *userInfo = @{@"messageKey":@"whatever message you want to send"};
  
  [ns postNotificationName:@"message" object:@"blah" userInfo:userInfo];
  
}
- (IBAction)handleTapGesture:(id)sender {
  NSLog(@"view tapped");
}
- (IBAction)handlePinchGesture:(id)sender {
  
  UIPinchGestureRecognizer *pinch = sender;
  
}
- (IBAction)handlePanGesture:(id)sender {
  UIPanGestureRecognizer *pan = sender;
  
  
  CGRect frame = self.pointView.frame;
  frame.origin = [pan locationInView:pan.view];
  self.pointView.frame = frame;
  
}
- (IBAction)handleLongPressGesture:(id)sender {
  UILongPressGestureRecognizer *longPress = sender;
  longPress.delegate = self;
  if (longPress.state == UIGestureRecognizerStateBegan){
    NSLog(@"long press action");
  } else {
    NSLog(@"%ld", longPress.state);
  }
  
}

@end
