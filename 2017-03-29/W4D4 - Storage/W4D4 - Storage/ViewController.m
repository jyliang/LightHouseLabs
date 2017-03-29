//
//  ViewController.m
//  W4D4 - Storage
//
//  Created by Jason Liang on 3/29/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // 1. retrieving via nsuserdefaults
  NSString *text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
  self.textField.text = text;
  
  
  // 2. retrieving via nsfilemanager
  NSFileManager *fileManager = [NSFileManager defaultManager];
  
  NSArray *docDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *docPath = [docDirectories firstObject];
  NSString *filePath = [NSString stringWithFormat:@"%@/%@", docPath, @"example.txt"];
  
  NSData *data = [fileManager contentsAtPath:filePath];
  NSString *text2 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  self.textField2.text = text2;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
  NSString *text = self.textField.text;
  [[NSUserDefaults standardUserDefaults] setObject:text forKey:@"name"];
  NSInteger age = 30;
  [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:age] forKey:@"age"];
  
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)save2:(id)sender {
  
  NSArray *docDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *docPath = [docDirectories firstObject];
  
  NSString *text = self.textField2.text;
  NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
  
  NSString *filePath = [NSString stringWithFormat:@"%@/%@", docPath, @"example.txt"];
  
  
//  1.
  [data writeToFile:filePath atomically:YES];
  
  // 2.
  NSFileManager *fileManager = [NSFileManager defaultManager];
  [fileManager createFileAtPath:filePath contents:data attributes:nil];
  
  

//  NSURL *docURL = [NSURL fileURLWithPath:docPath];
}

@end
