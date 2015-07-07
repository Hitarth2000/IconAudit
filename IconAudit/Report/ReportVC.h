//
//  ReportVC.h
//  IconAudit
//
//  Created by AMS on 07/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCommonVC.h"

@interface ReportVC : SuperCommonVC <UITableViewDataSource,UITableViewDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate,UIPickerViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
   NSString                                * picStatus;
    
    UIPopoverController                     * popOver;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl;

@property (nonatomic, retain) NSMutableArray    * array;
- (IBAction)clickonDone:(id)sender;

- (IBAction)clickonPhoto:(id)sender;
- (IBAction)clickonVideo:(id)sender;


@end
