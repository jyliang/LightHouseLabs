//
//  CustomCollectionViewCell.h
//  W3D3-CollectionView
//
//  Created by Jason Liang on 3/22/17.
//  Copyright © 2017 jasonliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)configureWithIndexPath:(NSIndexPath *)indexPath;

@end
