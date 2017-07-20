//
//  ViewController.m
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *IdTextField;

@end

@implementation ViewController

- (IBAction)archiveObject:(id)sender {
  Person *person = [[Person alloc] init];
  person.firstName = self.firstNameTextField.text;
  person.lastName = self.lastNameTextField.text;
  
  NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
  f.numberStyle = NSNumberFormatterDecimalStyle;
  person.idNumber = [f numberFromString:_IdTextField.text];
  
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:person];
  // Method 1: Store in NSUserDefaults
  [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"personData"];
  [[NSUserDefaults standardUserDefaults] synchronize];
  // Method 2: Store in local directory
//  NSString *path = [[[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] absoluteString] stringByAppendingString:@"/person.data"];
//  [data writeToFile:path atomically:YES];
  
}

- (IBAction)unarchiveObject:(id)sender {
  NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"personData"];
  Person *person = [NSKeyedUnarchiver unarchiveObjectWithData:data];
  self.firstNameTextField.text = person.firstName;
  self.lastNameTextField.text = person.lastName;
//  Person *person = [
  
  
  
                    
}

@end
