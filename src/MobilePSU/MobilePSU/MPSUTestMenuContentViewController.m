//
//  MPSUTestSelectViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/12/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSUTestMenuContentViewController.h"

@interface MPSUTestMenuContentViewController ()

@end

@implementation MPSUTestMenuContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.testIconButton setImage:[UIImage imageNamed:self.currTestIconImage] forState: UIControlStateNormal];
    self.testNameLabel.text = self.currTestName;
    
    self.testDurationLabel.text = self.currTestDuration;
    self.testQuestionsLabel.text = self.currTestQuestions;
    self.testScoreImageView.hidden = !self.currScoreImage;
    self.testScoreLabel.hidden = !self.currScoreImage;
    self.testScoreLabel.text = self.currScore;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectTest:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MPSUMain" bundle:nil];
    UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"PerformTest"];
    [self.navigationController pushViewController:loginController animated:YES];
}

@end
