//
//  MPSUDrawerViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSUDrawerViewController.h"

@interface MPSUDrawerViewController ()

@end

@implementation MPSUDrawerViewController

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
	// Do any additional setup after loading the view.
}

- (IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
