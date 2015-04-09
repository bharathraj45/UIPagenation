//
//  ViewController.h
//  PageApp
//
//  Created by Bharath Raj Venkatesh on 09/04/15.
//  Copyright (c) 2015 techolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource>


@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) NSArray *pageImages;

- (IBAction)restartAction:(id)sender;
@end

