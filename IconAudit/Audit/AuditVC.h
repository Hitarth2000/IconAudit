//
//  AuditVC.h
//  IconAudit
//
//  Created by AMS on 04/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperCommonVC.h"

@interface AuditVC : SuperCommonVC <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tbl;

@property (nonatomic, retain) NSMutableArray    * array;


- (IBAction) clickonLogout :(id)sender;


@end
