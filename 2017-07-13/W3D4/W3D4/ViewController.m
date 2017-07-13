//
//  ViewController.m
//  W3D4
//
//  Created by Jason Liang on 7/13/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "ViewController.h"
#import "CustomFlowLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) CustomFlowLayout *collectionViewFlowLayout;
@property(nonatomic) UICollectionViewFlowLayout *defaultFlowLayout;

@property (weak, nonatomic) IBOutlet UIButton *switchButton;
@property(nonatomic) NSInteger itemCount;
@property(nonatomic) UIButton *addButton;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.itemCount = 10;
  self.defaultFlowLayout = [[UICollectionViewFlowLayout alloc] init];
  self.collectionViewFlowLayout = [[CustomFlowLayout alloc] init];
  self.collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.defaultFlowLayout];
  self.collectionView.allowsSelection = YES;
  self.collectionView.allowsMultipleSelection = YES;
  [self.view addSubview:self.collectionView];
  
  // Add something here 1:
  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
  // Add something here 1':
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  
  self.addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.addButton.frame = CGRectMake(20, 20, 100, 100);
  [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
  self.addButton.titleLabel.text = @"Add"; // this doens't work
  self.addButton.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.addButton];
  [self.addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view bringSubviewToFront:self.switchButton];
}

- (IBAction)switchButtonTapped {
  NSLog(@"swtich button tapped");
  
  if (self.collectionView.collectionViewLayout == self.defaultFlowLayout) {
    [self.collectionView setCollectionViewLayout:self.collectionViewFlowLayout animated:YES];
  } else {
    [self.collectionView setCollectionViewLayout:self.defaultFlowLayout animated:YES];
  }
  
}

- (void)addButtonTapped {
  // Method 1
  
//  [self.collectionView reloadData];
  
  // Method 2
  
//  [self.collectionView performBatchUpdates:<#^(void)updates#> completion:<#^(BOOL finished)completion#>]
  
  [self.collectionView performBatchUpdates:^{
    self.itemCount++;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.itemCount-1 inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
  } completion:^(BOOL finished) {
    
  }];
  
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return _itemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  // Add something here 2:
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  
  NSArray *selectedIndexPaths = collectionView.indexPathsForSelectedItems;
  if ([selectedIndexPaths containsObject:indexPath]) {
    cell.backgroundColor = [UIColor yellowColor];
  } else {
    cell.backgroundColor = [UIColor redColor];
  }
  
  return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"%@", indexPath);
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor greenColor];
}

@end
