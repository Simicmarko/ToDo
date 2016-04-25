//
//  WalktroughCollectionViewCell.m
//  ToDo
//
//  Created by Cubes School 7 on 4/25/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "WalktroughCollectionViewCell.h"

@implementation WalktroughCollectionViewCell

- (void)setWalktroughItem:(WalktroughItem *)walktroughItem {
    _walktroughItem = walktroughItem;

    self.imageView.image = walktroughItem.image;
    self.textLabel.text = walktroughItem.text;
}

@end
