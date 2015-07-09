//
//  PhotoVC.h
//  IconAudit
//
//  Created by AMS on 07/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCommonVC.h"

@interface PhotoVC : SuperCommonVC <UITextViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView   * scroll;

@property (weak, nonatomic) IBOutlet UIView  *  viewContent;

@property (nonatomic, retain) UIImageView * img;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UITextView *txtView;
- (IBAction)clickonGo:(id)sender;

@end
