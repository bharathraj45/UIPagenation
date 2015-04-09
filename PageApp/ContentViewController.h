//
//  ContentViewController.h
//  PageApp
//
//  Created by Bharath Raj Venkatesh on 09/04/15.
//  Copyright (c) 2015 techolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property NSInteger pageIndex;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *imageFile;

@end
