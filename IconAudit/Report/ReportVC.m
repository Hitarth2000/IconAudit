//
//  ReportVC.m
//  IconAudit
//
//  Created by AMS on 07/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "ReportVC.h"
#import "AddCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "PhotoVC.h"

#define GALLERY         @"Gallery"
#define CAMERA          @"Camera"

@interface ReportVC ()

@end

@implementation ReportVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array = [NSMutableArray arrayWithCapacity:1];
    [_array addObject:@"Cause code 214"];
    [_array addObject:@"Please describe the problem"];
    [_array addObject:@"Add"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Report";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row > 1)
    {
        AddCell * cell ;
        cell = (AddCell *)[[[NSBundle mainBundle]
                            loadNibNamed:@"AddCell"
                            owner:self
                            options:nil] objectAtIndex:0];
        
        cell.lbl.text = [_array objectAtIndex:indexPath.row];
        
        [cell.btnPhoto addTarget:self action:@selector(clickonPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnVideo addTarget:self action:@selector(clickonVideo:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        
        cell.textLabel.text = [_array objectAtIndex:indexPath.row];
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row == 1) ? 150 : 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (IBAction)clickonDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickonPhoto:(id)sender
{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Options"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:GALLERY ,CAMERA, nil];
    actionSheet.tag = 99;
    [actionSheet showInView:self.view ];
}
- (IBAction)clickonVideo:(id)sender
{
    //[[UIBarButtonItem appearance] setTintColor:COLOR_INK_BLUE];
    NSString * model = [UIDevice currentDevice].model;
    if ([model rangeOfString:@"Simulator"].location != NSNotFound)
    {
        //[SharedFunction showAlertWithTitle:@"Info" andMsg:@"Camera not supported in this device."];
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                         message:@"Camera not supported in this device."
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.allowsEditing = YES;
    //imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    imagePicker.mediaTypes =    [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    imagePicker.delegate=self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

# pragma mark
# pragma mark ActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    {
        //[[UIBarButtonItem appearance] setTintColor:COLOR_INK_BLUE];
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:GALLERY])
        {
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];

            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.delegate=self;
            
            
            picStatus = GALLERY;
            
            
//            UIPopoverController* aPopover = [[UIPopoverController alloc]
//                                             initWithContentViewController:imagePicker];
//            aPopover.delegate = self;
//            popOver = aPopover;
//            
//            dispatch_async (dispatch_get_main_queue(), ^{
//                [popOver presentPopoverFromRect:self.view.frame
//                                         inView:self.view.superview
//                       permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//            });
            
             [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:CAMERA])
        {
            //[[UIBarButtonItem appearance] setTintColor:COLOR_INK_BLUE];
            NSString * model = [UIDevice currentDevice].model;
            if ([model rangeOfString:@"Simulator"].location != NSNotFound)
            {
                
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                                 message:@"Camera not supported in this device."
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles: nil];
                [alert show];
                return;
            }
            
            picStatus = CAMERA;
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.delegate=self;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }
}
# pragma mark
# pragma mark ImagePicker Delegates
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView * imgView = [[UIImageView alloc] init];
    imgView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    if ([picStatus isEqualToString:GALLERY])
    {
        //[popOver dismissPopoverAnimated:YES];
         [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    [self performSegueWithIdentifier:@"photo" sender:imgView];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"photo"])
    {
        UIImageView * imgv = (UIImageView*) sender;
        PhotoVC * photo = [segue destinationViewController];
        photo.img = imgv;
    }
    
}
@end
