//
//  FirstViewController.m
//  W2D4
//
//  Created by Jason Liang on 8/9/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "FirstViewController.h"
#import "Person.h"

@interface FirstViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) Person *person;
@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.person = [[Person alloc] init];
  [self.person addObserver:self
                forKeyPath:@"name"
                   options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial)
                   context:nil];
  
  // only do this once:
//  [self.person removeObserver:self forKeyPath:@"name"];
  //crash (if tried to remove more than once), can use try catch:
//  [self.person removeObserver:self forKeyPath:@"name"];
  
  // TextField value changed to observe: (Recommended)
  [self.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
  
  // This is a strech:
  //  self.textField.delegate = self;
  
  // NSNotificationCenter Method 1
  [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    NSLog(@"%@", note);
  }];
  
  // NSNotificationCenter Method 2
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"testnotificationkey" object:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  if ([keyPath isEqualToString:@"name"]) {
    NSLog(@"%@ - %@", object, change);
  }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSLog(@"%@", textField.text);
  return YES;
}

#pragma mark -

- (void)textFieldValueChanged {
  self.person.name = self.textField.text;
  NSLog(@"%@", self.textField.text);
}

- (IBAction)dismissButtonTapped:(id)sender {
  [self.textField resignFirstResponder];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"testnotificationkey" object:nil userInfo:@{@"type":@"test"}];

  // try not to this:
//  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"testnotificationkey" object:nil];
}

- (void)handleNotification:(NSNotification *)notification {
  NSLog(@"%@", notification.userInfo);
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
