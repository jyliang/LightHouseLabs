//
//  BaseObject.h
//  W1D3
//
//  Created by Jason Liang on 2019-05-01.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseObject : NSObject

@property (nonatomic, strong)  NSString *myCode;

- (instancetype)initWithMyCode:(NSString *)myCode;

@end

NS_ASSUME_NONNULL_END
