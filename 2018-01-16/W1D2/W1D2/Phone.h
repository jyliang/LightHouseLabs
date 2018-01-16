//
//  Phone.h
//  W1D2
//
//  Created by Jason Liang on 1/16/18.
//  Copyright © 2018 Jaosn Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject

@property(nonatomic, strong) NSString *modelName;

- (instancetype)initWithModelName:(NSString *)modelName;

- (void)printModelName;

@end
