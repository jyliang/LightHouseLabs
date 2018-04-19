//
//  FirstViewController.m
//  W2D4
//
//  Created by Jason Liang on 4/19/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSString *text;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"Jason is coding slowly" object:nil];
    
    [self addObserver:self forKeyPath:@"text" options:(
                                NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
//    self.text = @"new text";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowed) name:UIKeyboardWillShowNotification object:nil];
    
    [self.textField addTarget:self action:@selector(textFieldTextChanged) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextChanged {
    NSLog(@"changed to: %@", self.textField.text);
    self.text = self.textField.text;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    NSLog(@"%@", change[NSKeyValueChangeNewKey]);
    
}

- (void)keyboardShowed {
    NSLog(@"keyboard showed");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@", textField.text);
//    self.text = textField.text;
    return YES;
}


@end
