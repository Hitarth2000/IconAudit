//
//  BarCodeVC.m
//  IconAudit
//
//  Created by AMS on 06/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "BarCodeVC.h"

@interface BarCodeVC ()

@end

@implementation BarCodeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Barcode";
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

- (IBAction)clickonCode:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
