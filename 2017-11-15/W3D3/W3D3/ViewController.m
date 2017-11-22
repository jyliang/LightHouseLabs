//
//  ViewController.m
//  W3D3
//
//  Created by Jason Liang on 11/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayout.h"

@interface ViewController () <UICollectionViewDataSource>

@property (nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  CustomLayout *layout = [[CustomLayout alloc] init];
  
  layout.itemSize = CGSizeMake(100, 100);
  
  layout.minimumLineSpacing = 10; //between items in the same section
  layout.minimumInteritemSpacing = 0; //between sections
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
  [self.view addSubview:self.collectionView];
  
  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
  self.collectionView.dataSource = self;
  self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  cell.backgroundColor = [UIColor clearColor];
  return cell;
}

@end
