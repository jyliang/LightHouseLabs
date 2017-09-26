//
//  ViewController.m
//  W4D2
//
//  Created by Jason Liang on 9/26/17.
//  Copyright © 2017 jason. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
@import MapKit;
#import "BikeManager.h"

@interface ViewController () <MyLocationManagerDelegate>

@property(nonatomic, strong) LocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.locationManager = [[LocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestLocationPermissionIfNeeded];
}

#pragma mark - MyLocationManagerDelegate

- (void)passCurrentLocation:(CLLocation *)location {
  
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000);
  [_mapView setRegion:region animated:YES];
  
  
  [BikeManager nearbyBikes:location limit:10 block:^(NSArray *stations, NSError *error) {
    NSLog(@"%@", stations);
    
    dispatch_async(dispatch_get_main_queue(), ^{
      // remove existing annotations first
      NSArray *annotations = [_mapView annotations];
      [_mapView removeAnnotations:annotations];
      
      [_mapView addAnnotations:stations];
      
    });
    
  }];
  
}

@end
