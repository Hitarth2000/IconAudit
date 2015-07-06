//
//  AddAudit.h
//  IconAudit
//
//  Created by AMS on 06/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCommonVC.h"

@interface AddAudit : SuperCommonVC <UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tbl;

@property (nonatomic, retain) NSMutableArray    * array;

@property (nonatomic, retain) NSMutableArray    * arrayPicker;

@property (nonatomic, retain) NSString          * strTitle;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;
- (IBAction)clickonCancel:(id)sender;
- (IBAction)clickonDone:(id)sender;

@end
