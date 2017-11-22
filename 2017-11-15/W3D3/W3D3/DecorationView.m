//
//  DecorationView.m
//  W3D3
//
//  Created by Jason Liang on 11/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "DecorationView.h"

@implementation DecorationView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
  [super applyLayoutAttributes:layoutAttributes];
  self.backgroundColor = [UIColor purpleColor];
}

@end
