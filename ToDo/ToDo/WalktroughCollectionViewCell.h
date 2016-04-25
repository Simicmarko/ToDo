//
//  WalktroughCollectionViewCell.h
//  ToDo
//
//  Created by Cubes School 7 on 4/25/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalktroughItem.h"

@interface WalktroughCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) WalktroughItem *walktroughItem;
@end