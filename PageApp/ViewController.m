//
//  ViewController.m
//  PageApp
//
//  Created by Bharath Raj Venkatesh on 09/04/15.
//  Copyright (c) 2015 techolution. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pageController;
@synthesize pageTitles;
@synthesize pageImages;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pageTitles = @[@"Nature", @"Datq"];
    self.pageImages = @[@"page", @"page2"];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageController = (UIPageViewController *) vc;
    self.pageController.dataSource = self;
    ContentViewController *startVC =  [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startVC];
    
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.pageController.view.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 60);
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    ContentViewController *vc = (ContentViewController *) viewController;
    NSInteger index = vc.pageIndex;
    if(index == NSNotFound){
        return  nil;
    }
    
    index++;
    if(index == self.pageTitles.count){
        return  nil;
    }
    return  [self viewControllerAtIndex:index];
}

-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    ContentViewController *vc = (ContentViewController *) viewController;
    NSInteger index = vc.pageIndex;
    if(index == 0 || index == NSNotFound){
        return  nil;
    }
    
    index--;
    return  [self viewControllerAtIndex:index];
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return  self.pageTitles.count;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}

- (IBAction)restartAction:(id)sender {
    ContentViewController *startVC =  [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startVC];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

-(ContentViewController *)viewControllerAtIndex:(NSInteger) index{
    if(self.pageTitles.count == 0 || index >= self.pageTitles.count){
        return nil;
    }
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ContentViewController"];
    vc.imageFile = self.pageImages[index];
    vc.titleText = self.pageTitles[index];
    vc.pageIndex = index;
    return  vc;
}
@end
