//
//  LargeLabelTableViewCell.m
//  W3D2
//
//  Created by Jason Liang on 9/19/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "LargeLabelTableViewCell.h"

@implementation LargeLabelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
  
  //self.contentView
  
    // Configure the view for the selected state
}

- (void)prepareForReuse {
  [super prepareForReuse];
  self.textLabel.text = @"";
}

@end
