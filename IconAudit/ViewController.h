//
//  ViewController.h
//  IconAudit
//
//  Created by AMS on 04/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCommonVC.h"

@interface ViewController : SuperCommonVC <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lbl_Version;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Login;
@property (weak, nonatomic) IBOutlet UITextField *txt_ID;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

- (IBAction)clickonGo:(id)sender;



@end

