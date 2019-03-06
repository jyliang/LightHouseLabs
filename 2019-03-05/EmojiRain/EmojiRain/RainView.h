//
//  RainView.h
//  EmojiRain
//
//  Created by Jason Liang on 2019-03-05.
//  Copyright © 2019 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RainView : UIView

- (void)loadRain;
- (void)createItemWithFrame:(CGRect)frame;

- (void)startRain;
- (void)stopRain;

@end

NS_ASSUME_NONNULL_END
