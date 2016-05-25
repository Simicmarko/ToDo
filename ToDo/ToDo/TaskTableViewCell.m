//
//  TaskTableViewCell.m
//  ToDo
//
//  Created by Cubes School 7 on 4/15/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "TaskTableViewCell.h"
#import "Helpers.h"

@implementation TaskTableViewCell

#pragma mark -Properties

-(void)setTask:(Task *)task{
    _task = task;
    
    self.taskTitleLabel.text= task.title;
    self.taskDescriptionLabel.text= task.desc;
    self.taskGroupView.backgroundColor= [Helpers colorForTaskGroup:[task.group integerValue]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
