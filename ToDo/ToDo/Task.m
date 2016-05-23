//
//  Task.m
//  ToDo
//
//  Created by Cubes School 7 on 5/11/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "Task.h"

@implementation Task

-(BOOL)isLocationValid{
    CLLocationDegrees latitude =[self.latitude floatValue];
    CLLocationDegrees longitude =[self.longitude floatValue];
    
    if (latitude ==0.0 || longitude== 0.0) {
        return NO;
    }
    return YES;
}
#pragma mark - MKAnotation

-(CLLocationCoordinate2D)coordinate{
    CLLocationDegrees latitude = [self.latitude floatValue];
    CLLocationDegrees longitude =[self.longitude floatValue];
    return CLLocationCoordinate2DMake(latitude, longitude);
}

-(NSString *)title {
    return self.heading;
}

-(NSString *)subtitle {
    return self.desc;
}

@end
