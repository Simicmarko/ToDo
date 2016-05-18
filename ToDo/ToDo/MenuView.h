//
//  MenuView.h
//  ToDo
//
//  Created by Cubes School 7 on 5/18/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger, MenuOption){
    TASK_DETAILS_MENU_OPTION=1,
    ABOUT_DETAILS_MENU_OPTION,
    STATISTICS_DETAILS_MENU_OPTION,
    WALKTHROUGH_DETAILS_MENU_OPTION
};

@protocol MenuViewDelegate <NSObject>
@required
-(void) menuViewOptionTapped:(MenuOption)option;
@end



@interface MenuView : UIView
@property (weak, nonatomic) id<MenuViewDelegate> delegate;
@end
