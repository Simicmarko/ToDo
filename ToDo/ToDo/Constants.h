//
//  Constants.h
//  ToDo
//
//  Created by Cubes School 7 on 4/15/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


// Macros
#define COLOR(r,g,b,a)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
static NSString *const USER_IMAGE    = @"USER_IMAGE";
static NSString *const WALKTHROUGH_PRESENTED    = @"WALKTHROUGH_PRESENTED";
static NSString *const CITY_CHANGED = @"CITY_CHANGED";
static NSString *const OK_STRING = @"OK_STRING";
static NSString *const EMPTY_STRING = @"";
static NSString *const LOGGED_IN = @"LOGGED_IN";

static NSString *const SHOW_HOME = @"SHOW_HOME";
static NSString *const SHOW_LOGIN = @"SHOW_LOGIN";



// Colors
#define kOrangeColor             COLOR(254.0, 172.0, 73.0, 1.0)
#define kPurpleColor             COLOR(187.0, 114.0, 255.0, 1.0)
#define kTurquoColor             COLOR(72.0, 211.0, 194.0, 1.0)
#define kDescPlaceholdersColor   COLOR(29.0, 29.0, 38.0, 1.0)
#define ZERO_VALUE                  0.0

//Enums
typedef NS_ENUM (NSInteger, TaskGroup) {
    COMPLETED_TASK_GROUP = 1,
    NOT_COMPLETED_TASK_GROUP,
    IN_PROGRESS_TASK_GROUP
};

// URLs
static NSString *const CUBES_URL = @"http://www.cubes.rs";





#endif /* Constants_h */
