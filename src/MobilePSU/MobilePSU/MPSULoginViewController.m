//
//  MPSULoginViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/11/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSULoginViewController.h"

@interface MPSULoginViewController ()

@end

@implementation MPSULoginViewController

-(IBAction)FacebookLogin:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)TwitterLogin:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

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
    [self setNeedsStatusBarAppearanceUpdate];
	// Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
