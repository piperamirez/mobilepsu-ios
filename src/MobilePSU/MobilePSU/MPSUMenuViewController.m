//
//  MPSUMenuViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/11/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSUMenuViewController.h"

@interface MPSUMenuViewController ()

@end

@implementation MPSUMenuViewController

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
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    BOOL logged = YES;
    
    if (!logged) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MPSUMain" bundle:nil];
        UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"viewLogin"];
        [self presentViewController:loginController animated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
