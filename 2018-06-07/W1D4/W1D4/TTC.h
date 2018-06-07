//
//  TTC.h
//  W1D4
//
//  Created by Jason Liang on 6/7/18.
//  Copyright © 2018 Jason Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HappyDelegate
@optional
- (void)behappy;
@end

@protocol TTCDelegate <NSObject, HappyDelegate>

@required
- (void)drive;

@optional
- (void)chargeFare;

@end

@interface TTC : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id<TTCDelegate> delegate;

//- (NSString *)name;
//- (void)setName:(NSString *)name;

@end
