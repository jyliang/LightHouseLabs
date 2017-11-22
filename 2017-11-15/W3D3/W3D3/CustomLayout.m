//
//  CustomLayout.m
//  W3D3
//
//  Created by Jason Liang on 11/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "CustomLayout.h"
#import "DecorationView.h"

@implementation CustomLayout

- (instancetype)init {
  self = [super init];
  if (self) {
    [self registerClass:[DecorationView class] forDecorationViewOfKind:@"decoration"];
  }
  return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
  NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
  
  // decoration attributes injection:
  
  NSMutableArray *decorationAttributes = [[NSMutableArray alloc] init];
  
  for (UICollectionViewLayoutAttributes *attribute in attributes) {
    attribute.frame = CGRectMake(0, 0, 100, 100);
    
    UICollectionViewLayoutAttributes *decorLayoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"decoration" withIndexPath:attribute.indexPath];
//    UICollectionViewLayoutAttributes *decorLayoutAttributes = [self layoutAttributesForDecorationViewOfKind:@"decoration" atIndexPath:attribute.indexPath];
    if (decorLayoutAttributes) {
      decorLayoutAttributes.frame = attribute.frame;
      decorLayoutAttributes.zIndex = attribute.zIndex - 1;
      [decorationAttributes addObject:decorLayoutAttributes];
    }
    
    
  }
  
  [attributes addObjectsFromArray:decorationAttributes];
  
  return attributes;
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
//  if ([elementKind isEqualToString:@"decoration"]) {
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
//    return attributes;
//  }
//  return nil;
//}

@end
