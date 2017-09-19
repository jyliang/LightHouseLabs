//
//  SecondViewController.m
//  W3D2
//
//  Created by Jason Liang on 9/19/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "SecondViewController.h"
#import "LargeLabelTableViewCell.h"

@interface SecondViewController () <UITableViewDataSource>

@property(nonatomic, strong) NSArray *otherNames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _otherNames = @[@"Jason", @"Jaison Awesome", @"Nick Awesome", @"Paul Awesome"];

  
  /*
  Use Auto Layout when creating your table view cells.
  Set the table view rowHeight to UITableViewAutomaticDimension.
  Set the estimatedRowHeight or implement the height estimation delegate method.
   */
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  self.tableView.estimatedRowHeight = 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _otherNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  LargeLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  cell.label.text = _otherNames[indexPath.row];
  return cell;
}



@end
