///////
//  PhotoVC.m
//  IconAudit
//
//  Created by AMS on 07/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "PhotoVC.h"

@interface PhotoVC ()

@end

@implementation PhotoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //_imgView.image = self.img.image;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Photo";
    
    
    NSLog(@"Scroll :%@",_scroll.description);
    NSLog(@"View :%@",_viewContent.description);
    
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                     message:@"Under Developmenet."
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles: nil];
    [alert show];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Scroll :%@",_scroll.description);
    NSLog(@"View :%@",_viewContent.description);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickonGo:(id)sender {
}



- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [_scroll setContentOffset:CGPointMake(0, textView.frame.origin.y - 600) animated:YES];
    return TRUE;
}

- (void)textViewDidEndEditing:(UITextView *)textView;
{

}

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
     [_scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.view endEditing:YES];
    return TRUE;
}



@end
