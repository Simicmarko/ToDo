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

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ProfileImageView;

@end

@implementation HomeViewController
# pragma mark- UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
- ( NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer*tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickImage)];
    tap.numberOfTapsRequired =1;
    [self.ProfileImageView addGestureRecognizer:tap];
    self.ProfileImageView.userInteractionEnabled = YES;
    
    self. ProfileImageView.clipsToBounds= YES;
    self.ProfileImageView.layer.cornerRadius=self.ProfileImageView.frame.size.width/2;
};





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
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}









@end