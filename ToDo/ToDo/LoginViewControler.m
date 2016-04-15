//
//  LoginViewControler.m
//  ToDo
//
//  Created by Cubes School 7 on 3/30/16.
//  Copyright © 2016 Cubes School 7. All rights reserved
//

#import "LoginViewControler.h"

@interface LoginViewControler()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIView *maskLogoView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIView *footerView;

@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewControler

#pragma mark - Public API

- (void)prepareforAnimations {
    CGRect submitButtonFrame= self.submitButton.frame;
    submitButtonFrame.origin.x=self.submitButton.frame.size.width;
    self.submitButton.frame=submitButtonFrame;
    
    
    CGRect footerViewFrame= self.footerView.frame;
    footerViewFrame.origin.y=self.footerView.frame.size.height;
    self.footerView.frame=footerViewFrame;


    
}

- (void)animate {
    
    [UIView animateWithDuration:2.4 animations:^{
        CGRect frame=self.footerView.frame;
        frame.origin.y=625;
        self.footerView.frame=frame;
    }];
    
    [ UIView animateWithDuration:1.4 animations:^{
        self.maskLogoView.alpha=0.0;
    }];
    [UIView animateWithDuration:3.4
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
     
                     animations:^{
                         CGRect submitButtonFrame= self.submitButton.frame;
                         submitButtonFrame.origin.x=0.0;
                         self.submitButton.frame=submitButtonFrame;
                         
                     }completion:NULL] ;

   // [self.maskLogoView setAlpha:0.0]
}

- (void)configureTextField:(UITextField *)textField {
    if (textField.placeholder.length>0){
        UIColor*Color=[UIColor colorWithRed:117.0/225.0
                                      green:113.0/225.0
                                       blue:111.0/225.0
                                      alpha:1];
        
        
        NSDictionary*attributes = @{
                                    NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:14.0],
                                    NSForegroundColorAttributeName: Color};
        
        textField.attributedPlaceholder= [[[NSAttributedString alloc]init] initWithString:textField.placeholder
                                                                               attributes:attributes];
    }
}

#pragma mark - Actions

- (IBAction)SignUpButtonTapped:(UIButton *)sender {
}

- (IBAction)ForgotPasswordButtonTapped:(UIButton *)sender {
}

- (IBAction)SignInButtonTapped:(UIButton *)sender {
    sender.enabled = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"HomeSegue" sender:self];
    });
}

#pragma mark- View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTextField:self.usernameTextField];
    
    [self configureTextField:self.passwordTextField];
    
    [self.activityIndicatorView stopAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self animate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self prepareforAnimations];
}

@end