//
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
}

- (void)viewWillAppear:(BOOL)animated
{
    [self viewWillAppear:animated];
    self.title = @"Photo";
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

@end
