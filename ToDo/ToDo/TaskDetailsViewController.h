//
//  TaskDetailsViewController.h
//  ToDo
//
//  Created by Cubes School 7 on 5/20/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskDetailsViewController : UIViewController
@property (strong, nonatomic) Task *task;
@end