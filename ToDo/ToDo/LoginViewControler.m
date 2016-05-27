//
//  LoginViewControler.m
//  ToDo
//
//  Created by Cubes School 7 on 3/30/16.
//  Copyright © 2016 Cubes School 7. All rights reserved
//

#import "LoginViewControler.h"
#import "UIViewController+Utilities.h"

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
-(void)configureTextFieldPLaceholders {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc]init];
    [attributes setObject:[UIFont fontWithName:@"Avenir-Book" size:15.0] forKey:NSFontAttributeName];
    [attributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *usernamePlaceholder =[[NSAttributedString alloc] initWithString:self.usernameTextField.placeholder
                                                                             attributes:attributes];
    self.usernameTextField.attributedPlaceholder =usernamePlaceholder;
    
    NSAttributedString *passwordPlaceholder =[[NSAttributedString alloc] initWithString:self.passwordTextField.placeholder
                                                                             attributes:attributes];
    self.passwordTextField.attributedPlaceholder =passwordPlaceholder;
}

-(void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note)
     {
         NSDictionary* keyboardInfo = note.userInfo;
         NSValue* keyboardFrameBegin =[keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
         CGRect  keyboardFrameBeginRect = keyboardFrameBegin.CGRectValue;
         
         [UIView animateWithDuration:0.3 animations:^{
             CGRect frame = self.containerView.frame;
             frame.origin.y= self.view.frame.size.height - keyboardFrameBeginRect.size.height - self.containerView.frame.size.height;
             self.containerView.frame = frame;
         }];
     }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note)
     {
            [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.containerView.frame;
            frame.origin.y= self.containerViewOriginY;
            self.containerView.frame = frame;
         }];
     }];

    
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

-(IBAction)submitButtonTapped {
    if (self.usernameTextField.text.length==0) {
        [self presentErrorWithTittle:@"Validation" andError:@"Please add title."];
        return;
    }
    if (self.passwordTextField.text.length==0) {
        [self presentErrorWithTittle:@"Validation" andError:@"Please add short description."];
        return;
    }
    NSLog(@"SIGNING IN ...");
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:LOGGED_IN];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self.activityIndicatorView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.activityIndicatorView stopAnimating];
        [self performSegueWithIdentifier:@"HomeSegue" sender:self];
    });
    
}


#pragma mark- View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containerViewOriginY = self.containerView.frame.origin.y;
    
    [self configureTextFieldPLaceholders];
    
    
    [self.activityIndicatorView stopAnimating];
    
    [self registerForNotifications];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self animate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self prepareforAnimations];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITextFieldDelegate 

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.usernameTextField) {
        self.usernameImageView.image = [UIImage imageNamed:@"username-active"];
    }
    if (textField == self.passwordTextField) {
        self.passwordImageView.image = [UIImage imageNamed:@"password-active"];
    }

}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.usernameImageView.image = [UIImage imageNamed:@"username"];
    self.passwordImageView.image = [UIImage imageNamed:@"password"];
}








@end