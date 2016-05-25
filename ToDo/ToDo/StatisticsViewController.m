//
//  StatisticsViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 5/4/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "StatisticsViewController.h"
#import "DataMenager.h"
#import "Constants.h"

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

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat completedCount = [[DataMenager sharedInstance] numberOfTasksPerTaskGroup:COMPLETED_TASK_GROUP];
    CGFloat notCompletedCount = [[DataMenager sharedInstance] numberOfTasksPerTaskGroup:NOT_COMPLETED_TASK_GROUP];
    CGFloat inProgressCount = [[DataMenager sharedInstance] numberOfTasksPerTaskGroup:IN_PROGRESS_TASK_GROUP];
    CGFloat tasksCount = completedCount + notCompletedCount + inProgressCount;
    
    self.completedCountLabel.text = [NSString stringWithFormat:@"%.0f",completedCount];
    self.notCompletedCountLabel.text = [NSString stringWithFormat:@"%.0f",notCompletedCount];
    self.inProgressCountLabel.text =[NSString stringWithFormat:@"%.0f",inProgressCount];
    
    if (completedCount > 0) {
        CGFloat percentage = (completedCount/tasksCount)*100;
        self.completedPercentageLabel.text = [NSString stringWithFormat:@"%.0f",percentage];
    }else {
        self.completedPercentageLabel.text = @"0";
    }
    if (notCompletedCount > 0) {
        CGFloat percentage = (notCompletedCount/tasksCount)*100;
        self.notCompletedCountLabel.text = [NSString stringWithFormat:@"%.0f",percentage];
    }else {
        self.notCompletedPercentageLabel.text = @"0";
    }
    
       
    if (inProgressCount > 0) {
        CGFloat percentage = (inProgressCount/tasksCount)*100;
        self.inProgressCountLabel.text = [NSString stringWithFormat:@"%.0f",percentage];
    }else {
        self.inProgressCountLabel.text = @"0";
    }

}



@end
