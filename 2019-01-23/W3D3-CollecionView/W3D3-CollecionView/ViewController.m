//
//  ViewController.m
//  W3D3-CollecionView
//
//  Created by Jason Liang on 1/23/19.
//  Copyright © 2019 jason. All rights reserved.
//

#import "ViewController.h"
#import "LabelCollectionViewCell.h"

@interface ViewController () <
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray *names;
@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout1;
@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout2;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  self.names = @[@"Jason1", @"Jason2"];
  
  _flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
  _flowLayout1.itemSize = CGSizeMake(200, 200);
  _flowLayout1.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 200);
  
  _flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
  _flowLayout2.itemSize = CGSizeMake(100, 100);
  _flowLayout2.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 100);
  
  UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
//  layout.itemSize = CGSizeMake(self.view.bounds.size.width, 44);
}
- (IBAction)segmentValueChanged:(id)sender {
//  self.collectionView.delegate = nil;
  UISegmentedControl *control = sender;
  UICollectionViewFlowLayout *layout;
  if (control.selectedSegmentIndex == 0) {
    layout = self.flowLayout1;
  } else {
    layout = self.flowLayout2;
  }
  [self.collectionView setCollectionViewLayout:layout animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//  CGFloat side = MIN(collectionView.bounds.size.width, indexPath.item+1);
//  return CGSizeMake(side, side);
//}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 100;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  return CGSizeMake(collectionView.bounds.size.width, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
  return CGSizeMake(collectionView.bounds.size.width, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  UICollectionReusableView *supplementaryView;
  if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    supplementaryView.backgroundColor = [UIColor redColor];
  } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
    supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
    supplementaryView.backgroundColor = [UIColor purpleColor];
  }
  
  return supplementaryView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  //1. deque -> get my cell, cast accordingly
  LabelCollectionViewCell *cell = (LabelCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"labelCell" forIndexPath:indexPath];

  //2. update/customize the cell

  if (indexPath.item < self.names.count) {
    cell.label.text = self.names[indexPath.item];
  } else {
    cell.label.text = [NSString stringWithFormat:@"%li",(long)indexPath.item];
  }
  
  
  //3. return cell
  return cell;
  
}



@end
