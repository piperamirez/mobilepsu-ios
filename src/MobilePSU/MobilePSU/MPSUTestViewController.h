//
//  MPSUTestViewController.h
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPSUTestViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionAltA;
@property (weak, nonatomic) IBOutlet UILabel *questionAltB;
@property (weak, nonatomic) IBOutlet UILabel *questionAltC;
@property (weak, nonatomic) IBOutlet UILabel *questionAltD;
@property (weak, nonatomic) IBOutlet UILabel *questionAltE;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *exitButton;

- (IBAction)goBack:(id)sender;

@property (nonatomic, strong) NSMutableArray *questions;

@end
