//
//  LoginViewControler.h
//  ToDo
//
//  Created by Cubes School 7 on 3/30/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewControler : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIView *maskLogoView;
@property (weak,nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIView *footerView;

@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic) CGFloat containerViewOriginY;

-(IBAction)submitButtonTapped;
-(void)configureTextFieldPLaceholders;


@end