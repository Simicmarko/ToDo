//
//  HomeViewController.m
//  ToDo
//
//  Created by Cubes School 7 on 4/8/16.
//  Copyright © 2016 Cubes School 7. All rights reserved.
//

#import "HomeViewController.h"
#import "TaskTableViewCell.h"
#import "Constants.h"
#import "MenuView.h"
#import "UIViewController+Utilities.h"
#import "DataMenager.h"
#import "Helpers.h"
#import "Task.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,MenuViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ProfileImageView;
@property (weak, nonatomic) IBOutlet MenuView *MenuView;
@property (weak,nonatomic)IBOutlet UITableView *tableView;
@property (weak,nonatomic)IBOutlet UIImageView *profileImageView;
@property (weak,nonatomic)IBOutlet UIImageView *badgeImageView;
@property (weak,nonatomic)IBOutlet UILabel *badgeLabel;
@property (weak,nonatomic)IBOutlet UILabel *welcomeLabel;
@property (weak,nonatomic)NSMutableArray *itemsArray;


@end

@implementation HomeViewController
#pragma mark - Properties

-(NSMutableArray *) itemsArray {
    _itemsArray = [[DataMenager sharedInstance] fetchEntity:NSStringFromClass([Task class])
                                                 withFilter:nil
                                                withSortAsc:YES
                                                     forKey:@"data"];
}

# pragma mark -Private API

-(void)configureBadge{
    self.badgeImageView.alpha= (self.itemsArray.count ==0) ? ZERO_VALUE : 1.0;
    self.badgeLabel.alpha= (self.itemsArray.count ==0) ? ZERO_VALUE : 1.0;
    self.badgeLabel.text = [NSString stringWithFormat:@"%ld",self.itemsArray.count];
}
-(void)configureProfileImage {
    self. ProfileImageView.clipsToBounds= YES;
    self.ProfileImageView.layer.cornerRadius=self.ProfileImageView.frame.size.width/2;
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:USER_IMAGE]) {
        self.ProfileImageView.image=[[NSUserDefaults standardUserDefaults] objectForKey:USER_IMAGE] ;
        
        NSData*data =[[NSUserDefaults standardUserDefaults]objectForKey:USER_IMAGE];
        
        self.ProfileImageView.image= [[UIImage alloc] initWithData:data];
        
    }
    
    
};
-(void)configureWelcomeLabel{
    if ([Helpers isMorning]) {
        self.welcomeLabel.text = @"Good Morning!";
    } else{
        self.welcomeLabel.text = @" Good Afternoon!";
    }
}



# pragma mark- UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        self.itemsArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.taskTitleLabel.text = [NSString stringWithFormat:@"Red %ld", indexPath.row];
    
    switch (indexPath.row) {
        case COMPLETED_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kTurquoColor;
            break;
            
            
        case NOT_COMPLETED_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kOrangeColor;
            break;
            
            
        case IN_PROGRESS_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kPurpleColor;
            break;
            
        default:
            cell.taskGroupView.backgroundColor = kTurquoColor;
            break;
    }
    
    return cell;
}


-(void)pickImage {
    UIAlertController *alertControler= [UIAlertController alertControllerWithTitle:@"Choose source" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertControler addAction:[UIAlertAction actionWithTitle:@"Photo Library"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                         UIImagePickerController *pickerControler= [[UIImagePickerController alloc] init];
                                                         pickerControler.sourceType= UIImagePickerControllerSourceTypePhotoLibrary;
                                                         pickerControler.delegate= self;
                                                         pickerControler.allowsEditing=YES;
                                                         [self presentViewController:pickerControler animated:YES completion:nil];
    }]];
    
    
   
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront] ||
        [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        [alertControler addAction:[UIAlertAction actionWithTitle:@"Camera"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             UIImagePickerController *pickerControler= [[UIImagePickerController alloc] init];
                                                             pickerControler.sourceType= UIImagePickerControllerSourceTypeCamera;
                                                             pickerControler.delegate= self;
                                                             pickerControler.allowsEditing=YES;
                                                             [self presentViewController:pickerControler animated:YES completion:nil];
                                                         }]];
    }
    
    [alertControler addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction *action) {
                                                         
    }]];
    
    [self presentViewController:alertControler animated:YES completion:nil];
}

# pragma mark - View lifecycle

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MenuView.delegate = self;
    
    
    UITapGestureRecognizer*tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickImage)];
    tap.numberOfTapsRequired =1;
    [self.ProfileImageView addGestureRecognizer:tap];
   self.ProfileImageView.userInteractionEnabled = YES;
    
    [self configureProfileImage];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
 // if (![[NSUserDefaults standardUserDefaults]boolForKey:WALKTHROUGH_PRESENTED]) {
   // [self performSegueWithIdentifier:@"Walkthrough" sender: self];
    }
    
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      // [self performSegueWithIdentifier:@"AboutSegue" sender:self];
   // });
    
//}


# pragma mark - UITableViewDelegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

# pragma mark - UIimagePickerControlerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    self.ProfileImageView.image=image;
    NSData*data= UIImageJPEGRepresentation(image, 1.0);
    
    [[NSUserDefaults standardUserDefaults]  setObject:data forKey:USER_IMAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark - MenuView Delegate
-(void)menuViewOptionTapped:(MenuOption)option{
    switch (option) {
        case TASK_DETAILS_MENU_OPTION:{
            [self performSegueWithIdentifier:@"TaskDetailsSegue" sender:nil];
        break;
            case ABOUT_DETAILS_MENU_OPTION:{
                [self performSegueWithIdentifier:@"AboutSegue" sender:nil];
            }
            break;
            
            case STATISTICS_DETAILS_MENU_OPTION:{
                [self performSegueWithIdentifier:@"StatisticsSegue" sender:nil];
            }
            break;
            
            case WALKTHROUGH_DETAILS_MENU_OPTION:{
                [self performSegueWithIdentifier:@"Walkthrough" sender:nil];
            } break;
        }
    
    }
}
    @end
