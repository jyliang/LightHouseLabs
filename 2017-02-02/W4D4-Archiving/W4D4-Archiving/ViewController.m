//
//  ViewController.m
//  W4D4-Archiving
//
//  Created by Jason Liang on 2/2/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "SimpleObject.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
//  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//  SimpleObject *simpleObject = [SimpleObject new];
//  [ud setObject:simpleObject forKey:@"k"];
}

// Archiving Action
// Object -> NSData -> UserDefault
- (IBAction)archiveTapped:(id)sender {
  NSString *text = self.textField.text;
  Animal *animal = [[Animal alloc] init];
  animal.kind = text;
  NSData *animalData = [NSKeyedArchiver archivedDataWithRootObject:animal];
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [ud setObject:animalData forKey:@"kAnimalData"];
}

// Unarchiving Action
// UserDefault -> NSData -> Object
- (IBAction)unarchiveTapped:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSData *animalData = [ud objectForKey:@"kAnimalData"];
  Animal *animal = [NSKeyedUnarchiver unarchiveObjectWithData:animalData];
  self.textField.text = animal.kind;
}

// Store simple info directly into User Defaults.
- (IBAction)archiveTapped2:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [ud setObject:_textField.text forKey:@"kTFText"];
}

- (IBAction)unarchiveTapped2:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSString *text = [ud objectForKey:@"kTFText"];
  self.textField.text = text;
}

@end
