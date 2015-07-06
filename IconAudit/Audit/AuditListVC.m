//
//  AuditListVC.m
//  IconAudit
//
//  Created by AMS on 04/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "AuditListVC.h"
#import "AddAudit.h"

@interface AuditListVC ()

@end

@implementation AuditListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array = [NSMutableArray arrayWithCapacity:1];
    [_array addObject:@"Model 1"];
    [_array addObject:@"Model 2"];
    [_array addObject:@"Model 3"];
    [_array addObject:@"Model 4"];
    [_array addObject:@"Model 5"];
    [_array addObject:@"Model 6"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.strTitle;
}

- (void)didReceiveMemoryWarning {
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"addAudit" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addAudit"])
    {
        AddAudit * audio = [segue destinationViewController];
        audio.strTitle = self.strTitle;
    }
    
}

@end
