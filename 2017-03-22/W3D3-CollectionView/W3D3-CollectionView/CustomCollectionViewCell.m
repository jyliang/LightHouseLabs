//
//  CustomCollectionViewCell.m
//  W3D3-CollectionView
//
//  Created by Jason Liang on 3/22/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (void)configureWithIndexPath:(NSIndexPath *)indexPath {
  NSArray *images = @[@"cat", @"dog"];
  NSInteger index = indexPath.item % images.count;
  self.label.text = [NSString stringWithFormat:@"%d", (int)indexPath.item];
  self.imageView.image = [UIImage imageNamed:images[index]];
}

@end
