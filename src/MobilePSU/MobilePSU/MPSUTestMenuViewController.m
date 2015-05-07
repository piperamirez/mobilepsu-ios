//
//  MPSUTestMenuViewController.m
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import "MPSUTestMenuViewController.h"

@interface MPSUTestMenuViewController ()

@end

@implementation MPSUTestMenuViewController

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
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setNeedsStatusBarAppearanceUpdate];
	
    _testNameList       = @[
                           @"Lenguaje y Comunicación",
                           @"Matemática",
                           @"Historia y Geografía",
                           @"Biología",
                           @"Química",
                           @"Física"];
    
    _testQuestionsList  = @[
                           @"80 preguntas",
                           @"80 preguntas",
                           @"80 preguntas",
                           @"80 preguntas",
                           @"80 preguntas",
                           @"80 preguntas"];
    
    _testDurationList   = @[
                           @"2 horas y 30 minutos",
                           @"2 horas y 30 minutos",
                           @"2 horas y 30 minutos",
                           @"2 horas y 30 minutos",
                           @"2 horas y 30 minutos",
                           @"2 horas y 30 minutos"];
    
    _testScoreImageList = @[
                          @YES,
                          @NO,
                          @NO,
                          @YES,
                          @YES,
                          @NO];
    
    _testScoreList      = @[
                            @"720",
                            @"0",
                            @"0",
                            @"631",
                            @"540",
                            @"0"];
    
    _testIconImageList  = @[
                           @"test-380-lan@2x.png",
                           @"test-380-mat@2x.png",
                           @"test-380-his@2x.png",
                           @"test-380-bio@2x.png",
                           @"test-380-che@2x.png",
                           @"test-380-phy@2x.png"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    MPSUTestMenuContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((MPSUTestMenuContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((MPSUTestMenuContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.testNameList count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (MPSUTestMenuContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.testNameList count] == 0) || (index >= [self.testNameList count])) {
        return nil;
    }
        
    // Create a new view controller and pass suitable data.
    MPSUTestMenuContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.currTestIconImage = self.testIconImageList[index];
    pageContentViewController.currScoreImage = [self.testScoreImageList[index] boolValue];
    pageContentViewController.currScore = self.testScoreList[index];
    
    pageContentViewController.currTestName = self.testNameList[index];
    
    pageContentViewController.currTestDuration = self.testDurationList[index];
    pageContentViewController.currTestQuestions= self.testQuestionsList[index];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.testNameList count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
