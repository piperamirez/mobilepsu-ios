//
//  MPSUTestSelectViewController.h
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/12/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPSUTestMenuContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *testIconButton;
@property (weak, nonatomic) IBOutlet UIImageView *testScoreImageView;
@property (weak, nonatomic) IBOutlet UILabel *testScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *testNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *testQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *testDurationLabel;

- (IBAction)selectTest:(id)sender;

@property NSUInteger pageIndex;

@property NSString *currTestIconImage;
@property BOOL currScoreImage;
@property NSString *currScore;

@property NSString *currTestName;

@property NSString *currTestQuestions;
@property NSString *currTestDuration;

@end
