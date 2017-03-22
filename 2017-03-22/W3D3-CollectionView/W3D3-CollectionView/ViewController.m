//
//  ViewController.m
//  W3D3-CollectionView
//
//  Created by Jason Liang on 3/22/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()
<
  UICollectionViewDataSource,
  UICollectionViewDelegate,
  UICollectionViewDelegateFlowLayout
>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout1;
@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout2;

@property(nonatomic, strong) NSArray *layouts;
@property(nonatomic) NSInteger layoutIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
//  [self.collectionView reloadData];
  
  _flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
  _flowLayout1.itemSize = CGSizeMake(200, 200);
  _flowLayout1.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 200);

  _flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
  _flowLayout2.itemSize = CGSizeMake(100, 100);
  _flowLayout2.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 100);
  
  
  self.layouts = @[self.flowLayout1, self.flowLayout2];
  self.layoutIndex = 0;
  
  
//  NSMutableArray *animals;
//  // Start off your insertion / deletion
//  [self.collectionView performBatchUpdates:^{
//    // change your data
//    [animals insertObject:@"dog" atIndex:0];
//
//    // add insertion/deletion to the collectionview
//    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
//    
//  } completion:^(BOOL finished) {
//    
//  }];
  
  
  
}

- (IBAction)toggleLayout:(id)sender {
  self.layoutIndex = (self.layoutIndex + 1) % self.layouts.count;
  UICollectionViewFlowLayout *layout = self.layouts[self.layoutIndex];
  
  [self.collectionView setCollectionViewLayout:layout animated:YES];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
// 1. number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 10;
}
// 2. number of items in sections
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 10;
}
// 3. cell for the specified section and item index. NSIndexPath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//  NSInteger section = indexPath.section;
//  NSInteger item = indexPath.item;
  CustomCollectionViewCell *cell;
  cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
  [cell configureWithIndexPath:indexPath];
  
  return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
  return view;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"did select indexPath %@", indexPath);
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  return CGSizeMake(collectionView.bounds.size.width, 50);
}


@end
