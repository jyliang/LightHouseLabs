//
//  DataViewController.m
//  W3D3
//
//  Created by Jason Liang on 2019-05-15.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import "DataViewController.h"
#import "DateCollectionViewCell.h"

@interface DataViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat length = floor( ((CGRectGetWidth(self.collectionView.bounds) - layout.minimumInteritemSpacing * 6)) / 7);
    layout.itemSize = CGSizeMake(length, length);
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DateCollectionViewCell class]) forIndexPath:indexPath];
    cell.dateLabel.text = [NSString stringWithFormat:@"%d", indexPath.item + 1];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}


//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//}

#pragma mark - UICollectionViewFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(30 + indexPath.item, 30 + indexPath.item);
}


@end
