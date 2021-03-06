//
//  Helpers.m
//  ToDo
//
//  Created by Cubes School 7 on 5/23/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers

+(BOOL)isEmailValid:(NSString *)email{
    NSString *emailRegex =@"[A-ZO-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [emailTest evaluateWithObject:email];
    return isValid;
}

+(BOOL)isLoggedIn{
    return [[NSUserDefaults standardUserDefaults] boolForKey:LOGGED_IN];
}
+(UIColor *)colorForTaskGroup:(TaskGroup)group{
    UIColor *color = nil;
    switch (group) {
        case COMPLETED_TASK_GROUP:
            color = kTurquoColor;
            break;
            case NOT_COMPLETED_TASK_GROUP:
            color = kOrangeColor;
            break   ;
            case IN_PROGRESS_TASK_GROUP:
            color = kPurpleColor;
            break;
            
        default:
            break;
    }
    
    return color;
    
}
+(BOOL)isMorning{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger hour =components.hour;
    if (hour > 12) {
        return NO;
    }
    return YES;
}


@end
