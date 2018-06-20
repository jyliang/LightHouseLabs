//
//  MyCollectionViewController.m
//  W3D3
//
//  Created by Jason Liang on 6/20/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionViewCell.h"

@interface MyCollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout1;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout2;
@property (nonatomic, strong) UICollectionViewFlowLayout *currentLayout;

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.layout1 = [[UICollectionViewFlowLayout alloc] init];
  self.layout2.scrollDirection = UICollectionViewScrollDirectionVertical;
  self.currentLayout = self.layout1;
  
  self.layout2 = [[UICollectionViewFlowLayout alloc] init];
  self.layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  
  // Register cell classes (ones that aren't used in Storyboard)
  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
  
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

// Key method 1: provide cell count
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 100;
}

// Key method 2: provides cell UI
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  //PRO TIP: same output to get the reusable identifiers
  //  NSStringFromClass([MyCollectionViewCell class])
  //  @"MyCollectionViewCell"
  
  if (indexPath.item % 2 == 0) {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
    return cell;
  }
  
  // dequeue from the collectionview
  MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MyCollectionViewCell class]) forIndexPath:indexPath];
  
  // Apply data
  cell.label.text = [NSString stringWithFormat:@"%ld", indexPath.item];
  cell.backgroundColor = [self randomColor];
  return cell;
}

- (UIColor *)randomColor
{
  CGFloat red = arc4random() % 255 / 255.0;
  CGFloat green = arc4random() % 255 / 255.0;
  CGFloat blue = arc4random() % 255 / 255.0;
  UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
  return color;
}

#pragma mark <UICollectionViewDelegate>

- (void)transition {
  self.currentLayout = self.currentLayout == self.layout1 ? self.layout2 : self.layout1;
  [self.collectionView setCollectionViewLayout:self.currentLayout animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  [self transition];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return indexPath.item % 2 == 1 ? CGSizeMake(50, 50) : CGSizeMake(100, 100);
}
@end
