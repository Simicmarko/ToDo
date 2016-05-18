//
//  MenuView.m
//  ToDo
//
//  Created by Cubes School 7 on 5/18/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "MenuView.h"
#import "Constants.h"

#define kButtonSize         30.0
#define kAnimationDuration  0.3
#define kOrginX             128.0
@interface MenuView ()
@property (weak,nonatomic) IBOutlet UIButton *menuButton;
@property (weak,nonatomic) IBOutlet UIButton *button1;
@property (weak,nonatomic) IBOutlet UIButton *button2;
@property (weak,nonatomic) IBOutlet UIButton *button3;
@property (weak,nonatomic) IBOutlet UIButton *button4;
@property (weak,nonatomic) IBOutlet UILabel *label1;
@property (weak,nonatomic) IBOutlet UILabel *label2;
@property (weak,nonatomic) IBOutlet UILabel *label3;
@property (weak,nonatomic) IBOutlet UILabel *label4;
@property (nonatomic) BOOL menuOpened;
@end
@implementation MenuView

#pragma mark - Desinagted Initializers
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self loadViewFromNib];
    }
    
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self= [super initWithCoder:aDecoder]) {
        [self loadViewFromNib];
    }
    
    return self;
}

#pragma mark - Actions
-(IBAction)menuButtonTapped{
    if (self.menuOpened) {
        [self closeMenu];
    }else {
        [self openMenu];
    }
    
}
-(IBAction)menuOptionButtonTapped:(UIButton *)sender {
    [self closeMenu];
    // ako nas delegat reaguje na metodu onda cu i da mu je prosledimo,moramo da setujemo prethodno delegat,a delegat je view cont koji ce posedovati ovaj con
    
    if ([self.delegate respondsToSelector:@selector(menuViewOptionTapped:)]) {
        [self.delegate menuViewOptionTapped:sender.tag];
    }
    
}

#pragma mark -Private API
-(void)loadViewFromNib {
    UIView *view =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    view.frame = self.bounds;
    view.autoresizingMask =UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
    
}
-(void)prepareMenu {
    self.button1.alpha = ZERO_VALUE;
    self.button2.alpha = ZERO_VALUE;
    self.button3.alpha = ZERO_VALUE;
    self.button4.alpha = ZERO_VALUE;
    
    [self configureButton:self.button1];
    [self configureButton:self.button2];
    [self configureButton:self.button3];
    [self configureButton:self.button4];
    
   // self.menuButton.layer.cornerRadius=self.menuButton.frame.size.width/2
    
}
-(void)closeMenu {
    self.menuOpened= NO;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button4.center=self.menuButton.center;
        self.button4.alpha=1.0;
        self.label4.alpha=ZERO_VALUE;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button3.center=self.menuButton.center;
        self.button3.alpha=1.0;
        self.label3.alpha=ZERO_VALUE;
        }];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button2.center=self.menuButton.center;
        self.button2.alpha=1.0;
        self.label2.alpha=ZERO_VALUE;
        }];
        
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button1.center=self.menuButton.center;
        self.button1.alpha=1.0;
        self.label1.alpha=ZERO_VALUE;
        }];
        
        
    });

    
}
-(void)openMenu {
    self.menuOpened=YES;
    
    self.button1.alpha=1.0;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button1.frame=CGRectMake(kOrginX, 22, kButtonSize, kButtonSize);
        self.label1.alpha=1.0;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.button2.frame=CGRectMake(kOrginX, 60, kButtonSize, kButtonSize);
            self.button2.alpha=1.0;
            self.label2.alpha=1.0;
        
        }];
           });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:kAnimationDuration animations:^{
                self.button3.frame=CGRectMake(kOrginX, 98, kButtonSize, kButtonSize);
                self.button3.alpha=1.0;
                self.label3.alpha=1.0;
                
            }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.button4.frame=CGRectMake(kOrginX, 136, kButtonSize, kButtonSize);
            self.button4.alpha=1.0;
            self.label4.alpha=1.0;
            
        }];
    });

    
}
-(void)configureButton:(UIButton*)button{
    button.alpha=ZERO_VALUE;
    button.center=self.menuButton.center;
    
    button.layer.cornerRadius= button.frame.size.width/2;
    
    button.layer.shadowColor=[UIColor lightGrayColor].CGColor;
    button.layer.shadowOpacity = 1.0;
    button.layer.shadowOffset = CGSizeMake(0.05, 0.1);
    
}
#pragma mark- View Lifecycle
- (void)layoutSubviews {
    [self prepareMenu];
}

@end
