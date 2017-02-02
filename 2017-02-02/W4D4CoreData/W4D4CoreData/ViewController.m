//
//  ViewController.m
//  W4D4CoreData
//
//  Created by Jason Liang on 2/2/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "Person+CoreDataClass.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *personArray;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (IBAction)addButtonTapped:(id)sender {
  NSString *name = self.textField.text;
  if ([name length] == 0) {
    NSLog(@"Empty name not allowed.");
    return;
  }
  NSManagedObjectContext *context = [self getContext];
  Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
  person.firstName = name;
  
  // Option 1
  [[self appDelegate] saveContext];
  
  // Option 2
//  NSError *error;
//  [context save:&error];
  _textField.text = @"";
}

- (NSManagedObjectContext *)getContext {
  return [self getContainer].viewContext;
}

- (NSPersistentContainer *)getContainer{
  return [self appDelegate].persistentContainer;
}

- (AppDelegate *)appDelegate {
  return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (IBAction)showMeButtonTapped:(id)sender {
  // Where we want to retrieve stuff
  NSFetchRequest *request = [Person fetchRequest];
//  NSPredicate *nameSelection = [NSPredicate predicateWithFormat:@"firstName like %@", @"Min"];
//  [request setPredicate:nameSelection];
  
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                      initWithKey: @"firstName" ascending: YES];
  
  [request setSortDescriptors:@[sortDescriptor]];
  
  NSManagedObjectContext *context = [self getContext];
  NSError *error;
  NSArray *result = [context executeFetchRequest:request error:&error];
  
  if (error != nil) {
    NSLog(@"%@", error.localizedDescription);
  } else {
    self.personArray = result;
    [self.tableView reloadData];
  }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  Person *person = self.personArray[indexPath.row];
  cell.textLabel.text = person.firstName;
  return cell;
}


@end
