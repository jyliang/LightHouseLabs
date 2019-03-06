//
//  RainManager.m
//  Rain
//
//  Created by Jason Liang on 2019-03-06.
//  Copyright © 2019 Facebook. All rights reserved.
//

//// RNTMapManager.m
//#import <MapKit/MapKit.h>
//
//#import <React/RCTViewManager.h>
//
//@interface RNTMapManager : RCTViewManager
//@end
//
//@implementation RNTMapManager
//
//RCT_EXPORT_MODULE()
//
//- (UIView *)view
//{
//  return [[MKMapView alloc] init];
//}
//
//@end

#import "RNTRainManager.h"
#import "RainView.h"

@interface RNTRainManager()

@property (nonatomic) RainView *rainView;

@end

@implementation RNTRainManager

- (RainView *)rainView {
  if (!_rainView) {
    _rainView = [[RainView alloc] init];
  }
  return _rainView;
}

RCT_EXPORT_MODULE();

- (UIView *)view {
  return self.rainView;
}

RCT_EXPORT_METHOD(startRain) {
  [self.rainView startRain];
}

RCT_EXPORT_METHOD(stopRain) {
  [self.rainView stopRain];
}


@end
