//
//  MPSUTestViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSUTestViewController.h"
#import "MPSUQuestion.h"

@interface MPSUTestViewController ()

@end

@implementation MPSUTestViewController

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
    
    _questions = [NSMutableArray arrayWithCapacity:20];
    
    // TODO: fetch questions from service
    
    MPSUQuestion *question = [[MPSUQuestion alloc] init];
    question.questionIndex = 0;
    question.question = @"El cambio de lugar de fragmentos cromosómicos dentro del mismo cromosoma, o de fragmentos entre cromosomas no homólogos, se conoce como";
    question.alternatives = @[@"translocación.", @"duplicación.", @"supresión.", @"inversión.", @"deleción."];
    [_questions addObject:question];
    
    MPSUQuestion *question2 = [[MPSUQuestion alloc] init];
    question2.questionIndex = 1;
    question2.question = @"¿Qué mecanismo utilizan los macrófagos para eliminar gérmenes?";
    question2.alternatives = @[@"Osmosis", @"Fagocitosis", @"Necrosis", @"Osteoporosis", @"Metástasis"];
    [_questions addObject:question2];
    
    // Custom tables
    // http://www.onextrapixel.com/2012/11/12/how-to-use-twitter-bootstrap-to-create-a-responsive-website-design/
    
    MPSUTestViewController *testViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PerformTest"];
    
    testViewController.questions = _questions;
    
    //self.title = @"Prueba";
    
}

- (IBAction)fetchData;
{
    _questions = [NSMutableArray arrayWithCapacity:20];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:1337/data"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *questionDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             
             for (id keys in questionDict) {
                 NSLog(@"%@", keys);
             }
             
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestQuestionCell"];
    
    MPSUQuestion *question = (self.questions)[indexPath.row];
    
    question.question = [@"      " stringByAppendingString:question.question];
    
    UILabel *questionLabel = (UILabel *)[cell viewWithTag:100];
    
    UILabel *altALabel = (UILabel *)[cell viewWithTag:51];
    UILabel *altBLabel = (UILabel *)[cell viewWithTag:52];
    UILabel *altCLabel = (UILabel *)[cell viewWithTag:53];
    UILabel *altDLabel = (UILabel *)[cell viewWithTag:54];
    UILabel *altELabel = (UILabel *)[cell viewWithTag:55];
    
    altALabel.text = question.alternatives[0];
    altBLabel.text = question.alternatives[1];
    altCLabel.text = question.alternatives[2];
    altDLabel.text = question.alternatives[3];
    altELabel.text = question.alternatives[4];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 3;
    paragraphStyle.lineHeightMultiple = 1;
    paragraphStyle.hyphenationFactor = 1;
    
    UIFont *labelFont = [UIFont fontWithName:@"Helvetica-Light" size:16];
    
    UIColor *labelColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    NSAttributedString *labelText = [[NSAttributedString alloc] initWithString:question.question
                                                                    attributes:@{
                                                                                 NSParagraphStyleAttributeName: paragraphStyle,
                                                                                 NSFontAttributeName: labelFont,
                                                                                 NSForegroundColorAttributeName: labelColor}];
    
    questionLabel.attributedText = labelText;
    
    UILabel *questionNumberLabel = (UILabel *)[cell viewWithTag:101];
    questionNumberLabel.text = [NSString stringWithFormat:@"%d",question.questionIndex + 1];
    
    [questionLabel sizeToFit];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MPSUQuestion *question = (self.questions)[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestQuestionCell"];
    UILabel *questionLabel = (UILabel *)[cell viewWithTag:100];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 3;
    paragraphStyle.lineHeightMultiple = 1;
    paragraphStyle.hyphenationFactor = 1;
    
    UIFont *labelFont = [UIFont fontWithName:@"Helvetica-Light" size:16];
    
    UIColor *labelColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    NSAttributedString *labelText = [[NSAttributedString alloc] initWithString:question.question
                                                                    attributes:@{
                                                                                 NSParagraphStyleAttributeName: paragraphStyle,
                                                                                 NSFontAttributeName: labelFont,
                                                                                 NSForegroundColorAttributeName: labelColor}];
    
    questionLabel.attributedText = labelText;
    [questionLabel sizeToFit];
    
    
    return questionLabel.frame.size.height + 230;
}


@end
