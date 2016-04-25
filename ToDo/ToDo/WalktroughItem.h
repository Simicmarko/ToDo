//
//  WalktroughItem.h
//  ToDo
//
//  Created by Cubes School 7 on 4/25/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WalktroughItem : NSObject
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *image;

-(instancetype) initWithText: (NSString*)text andImage:(UIImage *)image;

@end
