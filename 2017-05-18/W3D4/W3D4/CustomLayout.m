//
//  CustomLayout.m
//  W3D4
//
//  Created by Jason Liang on 5/18/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout()

@property(nonatomic) NSArray *layouts;

@end

@implementation CustomLayout

- (CGSize)collectionViewContentSize {
  return self.collectionView.bounds.size;
}

- (void)prepareLayout {
  NSMutableArray *results = [[NSMutableArray alloc] init];
  
  NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
  for (int i = 0; i < itemCount ; i++) {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
    
    UICollectionViewLayoutAttributes *attributes;
    attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat randX = arc4random_uniform(self.collectionView.bounds.size.width);
    CGFloat randY = arc4random_uniform(self.collectionView.bounds.size.height);

    attributes.frame = CGRectMake(randX, randY, 20, 20);
    [results addObject:attributes];
  }
  self.layouts = results;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
  NSMutableArray *results = [[NSMutableArray alloc] init];
  for (UICollectionViewLayoutAttributes *attributes in self.layouts) {
    if (CGRectIntersectsRect(attributes.frame, rect)) {
      [results addObject:attributes];
    }
  }
  return results;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
  return self.attributes[indexPath.item];
}

@end
