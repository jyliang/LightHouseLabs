////
////  RandomLayout.m
////  AlrightCollectionVIews
////
////  Created by Nikita Kolmogorov on 24/03/16.
////  Copyright © 2016 Lighthouse Labs. All rights reserved.
////
//
//#import "RandomLayout.h"
//
//@interface RandomLayout ()
//
//@property (nonatomic) NSArray *savedAttributes;
//
//@end
//
//@implementation RandomLayout
//
//- (CGSize)collectionViewContentSize {
//  return CGSizeMake(200, 200);
//  }
//  
//  - (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    
//    NSMutableArray *result = [NSMutableArray array];
//    
//    for (UICollectionViewLayoutAttributes *attributes in self.savedAttributes) {
//      if (CGRectIntersectsRect(attributes.frame, rect)) {
//        [result addObject:attributes];
//      }
//    }
//    
//    return result;
//    }
//    
//    - (void)prepareLayout {
//      //    if (self.savedAttributes.count > 0) return;
//      
//      NSMutableArray *temp = [NSMutableArray array];
//      for (int item = 0; item < [self.collectionView numberOfItemsInSection:0]; item++) {
//        NSIndexPath *ip = [NSIndexPath indexPathForRow:item inSection:0];
//        
//        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:ip];
//        
//        CGFloat randX = arc4random_uniform(200);
//        CGFloat randY = arc4random_uniform(200);
//        
//        attr.frame = CGRectMake(randX, randY, 10, 10);
//        
//        CGFloat dX = arc4random_uniform(2)+1;
//        CGFloat dY = arc4random_uniform(2)+1;
//        
//        attr.transform = CGAffineTransformMakeScale(dX, dY);
//        [temp addObject:attr];
//      }
//      
//      self.savedAttributes = temp;
//}
//
//@end
