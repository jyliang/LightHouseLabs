//
//  PublisherViewController.m
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "PublisherViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Publisher+CoreDataClass.h"
#import "BookViewController.h"

@interface PublisherViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *publisherArray;

@end

@implementation PublisherViewController

- (AppDelegate *)appDelegate {
  return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (NSPersistentContainer *)getContainer{
  return [self appDelegate].persistentContainer;
}

- (NSManagedObjectContext *)getContext {
  return [self getContainer].viewContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.publisherArray = @[];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
    // Do any additional setup after loading the view.
  [self fetchPublisher];
}

- (IBAction)addButtonTapped:(id)sender {
  
  if (_textField.text.length == 0) {
    NSLog(@"publisher name is empty");
    return;
  }
  NSManagedObjectContext *context = [self getContext];
  Publisher *publisher = [NSEntityDescription insertNewObjectForEntityForName:@"Publisher" inManagedObjectContext:context];
  publisher.name = _textField.text;
  [[self appDelegate] saveContext];
  [self fetchPublisher];
}

- (void)fetchPublisher {

  NSFetchRequest *request = [Publisher fetchRequest];
  
  

//  NSPredicate *nameSelection = [NSPredicate predicateWithFormat:@"name like %@", @"publish"];
//  [request setPredicate:nameSelection];
  
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                      initWithKey: @"name" ascending: NO];
  [request setSortDescriptors:@[sortDescriptor]];
  
  NSManagedObjectContext *context = [self getContext];
  NSError *error;
  NSArray *result = [context executeFetchRequest:request error:&error];

  if (error != nil) {
    NSLog(@"%@", error.localizedDescription);
  } else {
    self.publisherArray = result;
    [self.tableView reloadData];
  }
}

#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.publisherArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  Publisher *publisher = self.publisherArray[indexPath.row];
  cell.textLabel.text = publisher.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Publisher *publisher = self.publisherArray[indexPath.row];
  [self performSegueWithIdentifier:@"book" sender:publisher];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  Publisher *publisher = sender;
  BookViewController *vc = segue.destinationViewController;
  vc.publisher = publisher;
}


@end

