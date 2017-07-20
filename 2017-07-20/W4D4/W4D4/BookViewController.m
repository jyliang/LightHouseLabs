//
//  BookViewController.m
//  W4D4
//
//  Created by Jason Liang on 7/20/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "BookViewController.h"
#import "Book+CoreDataClass.h"
#import "AppDelegate.h"

@interface BookViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *bookArray;

@end

@implementation BookViewController

- (AppDelegate *)appDelegate {
  return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.bookArray = @[];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self fetchBooks];
}

- (void)fetchBooks {
  self.bookArray = self.publisher.books.allObjects;
  
//  NSFetchRequest *request = [Book fetchRequest];
//  NSManagedObjectContext *context = self.publisher.managedObjectContext;
//  NSError *error;
//  NSArray *result = [context executeFetchRequest:request error:&error];
//  if (error != nil) {
//    NSLog(@"%@", error.localizedDescription);
//  } else {
//    self.bookArray = result;
    [self.tableView reloadData];
//  }
}

- (IBAction)addButtonTapped:(id)sender {
  if (_textField.text.length == 0) {
    NSLog(@"book name is empty");
    return;
  }
  NSManagedObjectContext *context = self.publisher.managedObjectContext;
  
  Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
  book.name = _textField.text;
  [self.publisher addBooksObject:book];
  [[self appDelegate] saveContext];
  [self fetchBooks];
}


#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.bookArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  Book *book = self.bookArray[indexPath.row];
  cell.textLabel.text = book.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Book *book = self.bookArray[indexPath.row];
  [self performSegueWithIdentifier:@"publisher" sender:book];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
