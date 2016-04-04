//
//  LoginViewControler.m
//  ToDo
//
//  Created by Cubes School 7 on 3/30/16.
//  Copyright © 2016 Cubes School 7. All rights reserved
//

#import "LoginViewControler.h"

@interface LoginViewControler()
@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewControler



#pragma mark - Private API

-(void)configureTextField:(UITextField *)textField {
    if (textField.placeholder.length>0){
        UIColor*Color=[UIColor colorWithRed:117.0/225.0
                                      green:113.0/225.0
                                       blue:111.0/225.0
                                      alpha:1];
                              
        
        NSDictionary*attributes = @{
                                    NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:14.0],
                                    NSForegroundColorAttributeName: [UIColor withColor]
                                    };
        textField.attributedPlaceholder= [[[NSAttributedString alloc]init] initwithString:textField.placeholder
                                                                               attributes:attributes];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - Actions

}
- (IBAction)ForgotPasswordButtonTapped:(UIButton *)sender {
}
- (IBAction)SignInButtonTapped:(UIButton *)sender {
}
- (IBAction)SignUpButtonTapped:(UIButton *)sender {
}

#pragma mark- View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTextField:self.usernameTextField];
    
    [self configureTextField:self.passwordTextField];

@end