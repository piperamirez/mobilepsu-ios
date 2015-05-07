//
//  MPSUTestMenuViewController.h
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPSUTestMenuContentViewController.h"

@interface MPSUTestMenuViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *testIconImageList;
@property (strong, nonatomic) NSArray *testScoreImageList;
@property (strong, nonatomic) NSArray *testScoreList;

@property (strong, nonatomic) NSArray *testNameList;

@property (strong, nonatomic) NSArray *testQuestionsList;
@property (strong, nonatomic) NSArray *testDurationList;

@end