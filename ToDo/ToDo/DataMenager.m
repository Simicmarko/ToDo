//
//  DataMenager.m
//  ToDo
//
//  Created by Cubes School 7 on 5/11/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "DataMenager.h"
#import "AppDelegate.h"
#import <MapKit/MapKit.h>


@interface DataMenager()
@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end
@implementation DataMenager

#pragma mark -Propertis

-(void)setUserLocation:(CLLocation *)userLocation{
    _userLocation=userLocation;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:userLocation
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                       if (error) {
                           NSLog(@"CLGeocoder error: %@",[error localizedDescription]);
                       }
                       if (placemarks.count>0) {
                           CLPlacemark *placemark = [placemarks firstObject];
                           self.userLocality =placemark.locality;
                           [[NSNotificationCenter defaultCenter] postNotificationName:CITY_CHANGED object:nil];
                       }
        
    }];
}

-(NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        AppDelegate *appDelegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
        _managedObjectContext=appDelegate.managedObjectContext;
    }
    return _managedObjectContext;
}

#pragma mark -Public API
+(instancetype)sharedInstance {
    static DataMenager *sharedManager;
    
    @synchronized(self) {
        if (sharedManager== nil) {
            sharedManager= [[DataMenager alloc]init];
        }
    }
    return sharedManager;
}
- (NSMutableArray*)fetchEntity:(NSString *)entityName
                    withFilter:(NSString *)filter
                   withSortAsc:(BOOL)sortAscending
                        forKey:(NSString *)sortKey{
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDescription= [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entityDescription];
    // Sorting
    
    if (sortKey !=nil) {
        NSSortDescriptor *sortDescriptior=[[NSSortDescriptor alloc]initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = @ [sortDescriptior];
        [fetchRequest setSortDescriptors:sortDescriptors];
        //Filtering
        if (filter !=nil) {
            NSPredicate *predicate= [NSPredicate predicateWithFormat:filter];
            [fetchRequest setPredicate:predicate];
        }
        NSError *error;
        NSMutableArray *resultsArray = [[self.managedObjectContext executeFetchRequest:fetchRequest  error:& error] mutableCopy];
        if (resultsArray ==nil) NSLog(@"Error fetching %@(s).",entityName);
        return resultsArray;
        
    }
    return nil;
    
}
-(void)deleteObjectInDatabase:(NSManagedObject *)object {
    
}
-(void)updateObject:(NSManagedObject *)object{
    
}
-(void)logObject:(NSManagedObject *)object{
    
}
-(CGFloat)numberOfTasksPerTaskGroup:(TaskGroup)group{
   return 0.0;
}

-(void)saveTaskWithTitle:(NSString*)title
             description: (NSString *)description
                   group: (NSInteger *)group{
    
}
@end