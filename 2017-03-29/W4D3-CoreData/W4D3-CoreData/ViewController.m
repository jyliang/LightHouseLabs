//
//  ViewController.m
//  W4D3-CoreData
//
//  Created by Jason Liang on 3/29/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Todo+CoreDataProperties.h"

@interface ViewController ()

@property(nonatomic, strong) NSFetchedResultsController *fetchController;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self createFetchController];
  
}

- (void)createFetchController {
  NSFetchRequest *fetchRequest = [Todo fetchRequest];
  NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:YES];
  fetchRequest.sortDescriptors = @[descriptor];
  NSManagedObjectContext *context = [self getContext];
  self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:@"root"];
  
//  self.fetchController.delegate = self // optional for monitor data change events
}

- (NSManagedObjectContext *)getContext {
  AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
  NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
  return context;
}

- (void)saveContext {
  AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
  [appDelegate saveContext];
}

- (IBAction)addTodo:(id)sender {
  NSManagedObjectContext *context = [self getContext];
  // creation
  Todo *todoItem = [[Todo alloc] initWithContext:context];
  todoItem.title = @"todo title";
  todoItem.todoDescription = @"description";
  todoItem.priority = 1;
  todoItem.completed = false;
  [context insertObject:todoItem];
  
  [self saveContext];
  
  // fetching
  [self.fetchController performFetch:nil];
  NSArray *objects = [self.fetchController fetchedObjects];
  
  NSLog(@"%@", objects);
  
}


@end
