//
//  WalkthroughtViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 4/22/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "WalkthroughtViewController.h"
#import "Constants.h"
#import "WalktroughItem.h"
#import "WalktroughCollectionViewCell.h"

@interface WalkthroughtViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic)IBOutlet UICollectionView *colectionView;
@property (weak, nonatomic)IBOutlet UIButton *closeButton;
@property (weak, nonatomic)IBOutlet UIPageControl*pageControl;
@property (strong, nonatomic) NSArray *itemsArray;
@end

@implementation WalkthroughtViewController

#pragma mak- Actions

- (IBAction)CloseButtonTapped:(UIButton*)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:WALKTHROUGH_PRESENTED];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [ self.navigationController popViewControllerAnimated:YES];
    
};

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemsArray=@[
                      [[WalktroughItem alloc] initWithText:@"Keep your work organized and/nquckly chec your reminds\nwith simple calendar."
                                                  andImage:[UIImage imageNamed:@"calendar"]],
                      [[WalktroughItem alloc]initWithText:@"Manage your tasks quick and easy\nform your phone"
                                                 andImage:[UIImage imageNamed:@"phone"]],
                      [[WalktroughItem alloc]initWithText:@"Quickly add tasks\nform home screen."
                                                 andImage:[UIImage imageNamed:@"tasks"]]
                      ];
    
    self.pageControl.numberOfPages = self.itemsArray.count;
}

#pragma mark - UIColectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WalktroughCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    WalktroughItem *item = [self.itemsArray objectAtIndex:indexPath.item];
    cell.walktroughItem= item;
    self.pageControl.currentPage= indexPath.row;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

@end