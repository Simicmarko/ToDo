//
//  WebViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 5/4/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic)UIDynamicAnimator *animator;
@end

@implementation WebViewController
#pragma mark - Actions

-(IBAction)closeButtonTapped{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
#pragma mark -Private API

-(void)animateCloseButton {
   
    
}
#pragma mark -View lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [ self animateCloseButton];
    self.closeButton.alpha= ZERO_VALUE;
}

@end
