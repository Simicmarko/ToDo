//
//  WalkthroughtViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 4/22/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "WalkthroughtViewController.h"
#import "Constants.h"

@interface WalkthroughtViewController ()

@end

@implementation WalkthroughtViewController

#pragma mark- Actions


-(IBAction)CloseButtonTapped:(UIButton*)sender{
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:WALKTHROUGH_PRESENTED];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [ self.navigationController popViewControllerAnimated:YES];
    
};


@end
