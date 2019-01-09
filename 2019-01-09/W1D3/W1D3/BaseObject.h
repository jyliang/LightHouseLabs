//
//  BaseObject.h
//  W1D3
//
//  Created by Jason Liang on 1/9/19.
//  Copyright © 2019 jasonliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseObject : NSObject

@property (nonatomic, strong) NSString *text;

// delcared in public interface.
- (void)publicMethod;
// it will print the description in a customized way.
- (void)printDescription;

@end

NS_ASSUME_NONNULL_END
