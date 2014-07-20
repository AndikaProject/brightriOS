//
//  RBHomeTabBarController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/20/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBHomeTabBarController.h"

#import "RBLoginViewController.h"

@interface RBHomeTabBarController ()

@property (nonatomic, assign) BOOL firstLaunch;

@end

@implementation RBHomeTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _firstLaunch = YES;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_firstLaunch) {
        _firstLaunch = NO;
        RBLoginViewController *controller = [RBLoginViewController controllerWithStoryBoard:self.storyboard];
        [self presentViewController:controller animated:YES completion:nil];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end