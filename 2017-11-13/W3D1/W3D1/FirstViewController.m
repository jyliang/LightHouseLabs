//
//  FirstViewController.m
//  W3D1
//
//  Created by Jason Liang on 11/13/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UIScrollViewDelegate>

@property(strong, nonatomic) UIImageView *imageView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  scrollView.backgroundColor = [UIColor brownColor];
  
//  CGRect firstViewFrame = CGRectMake(0, 0, scrollView.bounds.size.width, 2000);
//  UIView *firstView = [[UIView alloc] initWithFrame:firstViewFrame];
//  [scrollView addSubview:firstView];
//  firstView.backgroundColor = [UIColor redColor];
//  scrollView.contentSize = firstView.bounds.size;
//  scrollView.alwaysBounceVertical = YES;
//  scrollView.bounces = NO;
  
  self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"maxresdefault"]];
  
  [scrollView addSubview:self.imageView];
  scrollView.contentSize = self.imageView.bounds.size;
  
  scrollView.minimumZoomScale = 0.5;
  scrollView.maximumZoomScale = 4;
  scrollView.delegate = self;
  
  scrollView.contentOffset = CGPointMake(100, 0);
  
//  scrollView.panGestureRecognizer
//  scrollView.pinchGestureRecognizer
  
  [self.view addSubview:scrollView];
  
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  
  // override the x offset back to 0.
  targetContentOffset->x = 0;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.imageView;
}

@end
