//
//  ViewController.m
//  W3D3-CollectionView
//
//  Created by Jason Liang on 3/22/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
// 1. number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}
// 2. number of items in sections
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 100;
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

@end
