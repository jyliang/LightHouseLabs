//
//  FirstViewController.m
//  W3D2
//
//  Created by Jason Liang on 9/19/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "FirstViewController.h"
#import "Names.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *otherNames;

@property (nonatomic, strong) NSArray *names;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _otherNames = @[@"Jaison", @"Nick", @"Paul", @"Jason"];
  
  _names = @[_otherNames, [Names getNames]];
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  //self.tableView.backgroundView
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return _names.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // tableview - check if it's the right one
  // section - check to see which section the delegate method is asking
  
  NSArray *names = _names[section];
  
  return names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row; //indexPath.item
  //UITableViewCell *cell = [[UITableViewCell alloc] init];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  
  NSArray *names = _names[section];
  NSString *text = names[row];
  
  if (cell.textLabel.text.length > 0) {
    NSLog(@"this cell is being reused. %@", cell.textLabel.text);
  }
  
  cell.textLabel.text = text;
  
  if (indexPath.row % 2 == 0) {
    cell.backgroundColor = [UIColor yellowColor];
  } else {
    cell.backgroundColor = [UIColor purpleColor];
  }
  
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if (section == 0) {
    return @"Classmate names";
  } else {
    return @"Pet names";
  }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row % 2 == 0) {
    return 50;
  } else {
    return 100;
  }
}

@end
