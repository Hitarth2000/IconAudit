//
//  ItemsVC.m
//  IconAudit
//
//  Created by AMS on 06/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "ItemsVC.h"
#import "ReportVC.h"

@interface ItemsVC ()

@end

@implementation ItemsVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    _array = [NSMutableArray arrayWithCapacity:1];
    [_array addObject:@"Paints"];
    [_array addObject:@"Parts"];
    [_array addObject:@"Packaging"];
    [_array addObject:@"Plastic"];
    [_array addObject:@"Metal"];
    [_array addObject:@"Foam"];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    //[self performSegueWithIdentifier:@"report" sender:nil];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ReportVC"];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:NULL];
    
//    ReportVC * report = [[ReportVC alloc] initWithNibName:@"ReportVC" bundle:nil];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:report];
//    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addAudit"])
    {
//        AddAudit * audio = [segue destinationViewController];
//        audio.strTitle = self.strTitle;
    }
    
}

@end
