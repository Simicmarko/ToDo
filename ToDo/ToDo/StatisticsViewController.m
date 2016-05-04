//
//  StatisticsViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 5/4/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *completedPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *notCompletedPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *inProgressPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *notCompletedCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *inProgressCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation StatisticsViewController

#pragma mark - Actions
-(IBAction)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



@end
