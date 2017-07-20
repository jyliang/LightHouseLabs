//
//  CustomFlowLayout.m
//  W3D4
//
//  Created by Jason Liang on 7/13/17.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "CustomFlowLayout.h"
#define degreesToRadians(x) (M_PI * x / 180.0)

@interface CustomFlowLayout ()

@property(nonatomic) NSMutableArray *layoutAttributes;

@end

@implementation CustomFlowLayout

-(void)prepareLayout{
  //Populate layout attributes here
  self.layoutAttributes = [@[] mutableCopy];
  for (NSInteger section = 0; section < [self.collectionView numberOfSections]; section++)
  {
    for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++)
    {
      UICollectionViewLayoutAttributes *attributes;
      NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
      attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
      
      //Rect Size
      attributes.frame = CGRectMake(0, 0, 60, 60);
      
      //Angle
      CGFloat angle = degreesToRadians((float)rand() / RAND_MAX * 20);
      attributes.transform = CGAffineTransformMakeRotation(angle);
      
    }
  }
}

//- (void)prepareLayout {
//  // populate your layoutAttibutes
//
//  self.layoutAttributes = [[NSMutableArray alloc] init];
//  NSInteger count = [self.collectionView numberOfItemsInSection:0];
//  for (NSInteger index = 0; index < count; index++) {
//    UICollectionViewLayoutAttributes *attributes;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
//    attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    
//    // which row is this cell on, figure out y
//    
//    // which column is this cell on, figure out x
//    
//    // figure out item spacing
//    
//    attributes.frame = CGRectMake(0, 100 * index, 100, 100);
//
//    [self.layoutAttributes addObject:attributes];
//  }
//  
//}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
  
  
  NSArray *layouts = [super layoutAttributesForElementsInRect:rect];
  
  for (UICollectionViewLayoutAttributes *attributes in layouts) {
    attributes.alpha = (float)rand() / RAND_MAX;
    CGFloat angle = degreesToRadians((float)rand() / RAND_MAX * 90);
    attributes.transform = CGAffineTransformMakeRotation(angle);
  }
  return layouts;
}

//layoutAttributesForElementsInRect

//- (CGSize)collectionViewContentSize {
//  return CGSizeMake(100000, 100000);
//}

@end
