//
//  TaskDetailsViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 5/20/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "TaskDetailsViewController.h"
#import "DataMenager.h"
#import <MapKit/MapKit.h>
#import "UIViewController+Utilities.h"


#define kRegionRadius 50000

@interface TaskDetailsViewController () <UITextFieldDelegate>
@property (weak, nonatomic)IBOutlet UITextField *tittleTextField;
@property (weak, nonatomic)IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic)IBOutlet UIButton *addButton;
@property (weak, nonatomic)IBOutlet UIButton *mapButton;
@property (weak, nonatomic)IBOutlet UILabel *cityLabel;
@property (weak, nonatomic)IBOutlet MKMapView *mapView;
@property (weak, nonatomic)IBOutlet UIImageView *groupSelectorImageView;
@property (weak, nonatomic)IBOutlet UIView *completedView;
@property (weak, nonatomic)IBOutlet UIView *notCompletedView;
@property (weak, nonatomic)IBOutlet UIView *inProgressView;
@property (nonatomic) NSInteger group;
@end

@implementation TaskDetailsViewController

#pragma mark - Properties

-(void)setGroup:(NSInteger)group {
    _group= group;
    
    __block CGPoint point;
    
    switch (group) {
        case COMPLETED_TASK_GROUP:
        point = self.completedView.center;
        break;
        case NOT_COMPLETED_TASK_GROUP:
        point =self.notCompletedView.center;
        break;
        case IN_PROGRESS_TASK_GROUP:
        point= self.inProgressView.center;
        break;
    }
    [UIView animateWithDuration:0.4 animations:^{
        self.groupSelectorImageView.center = point;
    }];
}
#pragma mark -Actions

-(IBAction)backButtonTapped {
    if ([self isEdited] && !self.task) {
        [self configureAlert];
    } else {
    [self.navigationController popViewControllerAnimated:YES];
}
}

-(IBAction)addButtonTapped: (UIButton *)sender{
    [self saveTask];
    
}

-(IBAction)mapButtonTapped: (UIButton *) sender{
    sender.selected= !sender.selected;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.mapView.alpha = (sender.selected) ? 1.0 : ZERO_VALUE;
    }];
    
}
- (IBAction)groupButtonTapped: (UIButton *) sender {
    self.group =sender.tag;
    
}

#pragma mark - Private API

-(void)configureTextFieldPlaxeholders{
    NSMutableDictionary *titleAttributes = [[NSMutableDictionary alloc]init];
    [titleAttributes setObject:[UIFont fontWithName:@"Avenir-Light" size:35.0]
                        forKey:NSFontAttributeName];
    [titleAttributes setObject:[UIColor whiteColor]
                        forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *titlePlaceholder =[[NSAttributedString alloc] initWithString:self.tittleTextField.placeholder
                                                                          attributes:titleAttributes];
    self.tittleTextField.attributedPlaceholder =titlePlaceholder;
    
    NSMutableDictionary *descriptionAttributes = [[NSMutableDictionary alloc]init];
    [descriptionAttributes setObject:[UIFont fontWithName:@"Avenir-Book" size:14.0]
                        forKey:NSFontAttributeName];
    [descriptionAttributes setObject:kDescPlaceholdersColor
                        forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *descriptionPlaceholder =[[NSAttributedString alloc] initWithString:self.descriptionTextField.placeholder
                                                                          attributes:descriptionAttributes];
    self.descriptionTextField.attributedPlaceholder =descriptionPlaceholder;

}

-(void) configureAlert{
    
}
-(BOOL)isEdited {
    return NO;
    
}


-(void) saveTask {
    if (self.tittleTextField.text.length==0) {
        [self presentErrorWithTittle:@"Validation" andError:@"Please add title."];
        return;
    }
    if (self.descriptionTextField.text.length==0) {
        [self presentErrorWithTittle:@"Validation" andError:@"Please add short description."];
           return;
    }
    if (self.task) {
        self.task.heading =self.tittleTextField.text;
        self.task.desc = self.descriptionTextField.text;
        self.task.group =[NSNumber numberWithInteger:self.group];
        [[DataMenager sharedInstance] updateObject:self.task];
        
    } else {
        [[DataMenager sharedInstance] saveTaskWithTitle:self.tittleTextField.text
                                            description:self.descriptionTextField.text
                                                  group:self.group];
    }
    
    self.tittleTextField.text = EMPTY_STRING;
    self.descriptionTextField.text = EMPTY_STRING;
    [self backButtonTapped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextFieldPlaxeholders];

}
@end