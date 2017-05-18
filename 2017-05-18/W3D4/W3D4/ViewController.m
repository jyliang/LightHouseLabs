//
//  ViewController.m
//  W3D4
//
//  Created by Jason Liang on 5/18/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayout.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewLayout *firstLayout;
@property (nonatomic) CustomLayout *customLayout;
@property (nonatomic) NSInteger itemCount;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  self.collectionView.allowsMultipleSelection = YES;
  self.firstLayout = self.collectionView.collectionViewLayout;
  self.itemCount = 20;
  self.customLayout = [[CustomLayout alloc] init];
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)changeLayout:(id)sender {
  if (self.collectionView.collectionViewLayout == self.firstLayout) {
    [self.collectionView setCollectionViewLayout:self.customLayout animated:YES];
  } else {
    [self.collectionView setCollectionViewLayout:self.firstLayout animated:YES];
  }
}

- (IBAction)addItem:(id)sender {
  
  // version 1
//  [self.collectionView reloadData];
  
  // version 2 - animated
  
  [self.collectionView performBatchUpdates:^{
    self.itemCount -= 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.itemCount-1 inSection:0];
//    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
  } completion:^(BOOL finished) {
    
  }];
  
}

//MARK:

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.itemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  cell.backgroundColor = [UIColor greenColor];
  NSArray *selectedIndexPaths = collectionView.indexPathsForSelectedItems;
  if ([selectedIndexPaths containsObject:indexPath]) {
    cell.backgroundColor = [UIColor redColor];
  }
  return cell;
}

//MARK:

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  return indexPath.item % 2 == 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor redColor];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor purpleColor];
}

//MARK:

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(50, 50);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 20;
}

@end
