//
//  AuditVC.m
//  IconAudit
//
//  Created by AMS on 04/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "AuditVC.h"
#import "AuditListVC.h"

@interface AuditVC ()

@end

@implementation AuditVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array = [NSMutableArray arrayWithCapacity:1];
    [_array addObject:@"Bicycle"];
    [_array addObject:@"Treadmill"];
    [_array addObject:@"Home Gym"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem * btnLogout = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                                    style: UIBarButtonItemStylePlain
                                                                   target:self
                                                                  action:@selector(clickonLogout:)];
    self.navigationItem.leftBarButtonItem = btnLogout;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{

}
- (IBAction) clickonLogout :(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
   
    [self performSegueWithIdentifier:@"auditlist" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"auditlist"])
    {
        NSIndexPath * path = (NSIndexPath*) sender;
        AuditListVC * audio = [segue destinationViewController];
        audio.strTitle = [_array objectAtIndex:path.row];
    }
    
}

@end
