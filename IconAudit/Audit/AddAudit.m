//
//  AddAudit.m
//  IconAudit
//
//  Created by AMS on 06/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "AddAudit.h"
#import "BarCodeVC.h"

@interface AddAudit ()

@end

@implementation AddAudit

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewBottom.hidden = TRUE;
    
    _array = [NSMutableArray arrayWithCapacity:1];
    [_array addObject:@"Item number"];
    [_array addObject:@"Product code"];
    
    _arrayPicker = [NSMutableArray arrayWithCapacity:1];
    [_arrayPicker addObject:@"123"];
    [_arrayPicker addObject:@"1234"];
    [_arrayPicker addObject:@"12345"];
    [_arrayPicker addObject:@"123456"];
    [_arrayPicker addObject:@"1234567"];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = self.strTitle;
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
    
    if (indexPath.row == 0)
    {
        BarCodeVC * bar = [[BarCodeVC alloc] initWithNibName:@"BarCodeVC" bundle:nil];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:bar];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }
    else
    {
        _viewBottom.hidden = FALSE;
    }
    
}

#pragma mark
#pragma mark PickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  _arrayPicker.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *lblTitle = [[UILabel alloc] init] ;
    lblTitle.font = [UIFont boldSystemFontOfSize:14];
    lblTitle.numberOfLines = 1;
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    
    lblTitle.text = [_arrayPicker objectAtIndex:row];
    
    return  lblTitle;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

}

- (IBAction)clickonCancel:(id)sender {
    
    _viewBottom.hidden = TRUE;
    
}
- (IBAction)clickonDone:(id)sender {
    _viewBottom.hidden = TRUE;
}
@end
