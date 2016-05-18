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
    [UIView animateWithDuration:0.5 animations:^{
        self.closeButton.alpha=1.0;
    } completion:^(BOOL finished) {
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.closeButton]];
        [self.animator addBehavior:gravityBehavior];
        
        UICollisionBehavior *collisionBehavior= [[UICollisionBehavior alloc]initWithItems:@[self.closeButton]];
        collisionBehavior.translatesReferenceBoundsIntoBoundary=YES;
        [self.animator addBehavior:collisionBehavior];
        
        UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[self.closeButton]];
        elasticityBehavior.elasticity =0.5;
        [self.animator addBehavior:elasticityBehavior];
    }];
    
}
#pragma mark -View lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
        self.closeButton.alpha= ZERO_VALUE;
   // self. urlString= @"https://www.google.rs/?client=safari&channel=mac_bm&gws_rd=cr&ei=zk48V8fTEsmysQGmlYSQDA";
    if (self.urlString) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self animateCloseButton];
}
#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible= YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible= NO;
    
}
@end
