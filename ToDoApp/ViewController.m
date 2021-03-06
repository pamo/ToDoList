//
//  ViewController.m
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/9/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import "ViewController.h"
#import "ItemCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editItem;
@end

@implementation ViewController
- (void)setItems:(NSMutableArray *)items{
    if (_items != items) {
        _items = [items mutableCopy];
    } else {
        _items = [NSMutableArray arrayWithObjects:@"New item", nil];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.items = [NSMutableArray arrayWithObjects:@"Go to the gym", @"Tan", @"Laundry", nil];
    [self.tableView reloadData];

    UINib *nib = [UINib nibWithNibName:@"ItemCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ItemCell"];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reorderItems:(id)sender {
    [self.tableView setEditing:YES animated:YES];
}
- (IBAction)addItems:(id)sender {
    NSMutableArray *savedItems = self.items;
    [self.items addObject:@""];
    [self.tableView reloadData];

}

#pragma mark - Textfield Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSUInteger index = [self.items count]-1;
    [self.items replaceObjectAtIndex:index withObject:textField.text];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setEditing:YES animated:YES];
    cell.inputField.text = [self.items objectAtIndex:indexPath.row];
    cell.inputField.delegate = self;
    
    NSLog(@"%@", [self.items objectAtIndex:indexPath.row]);

    return cell;
}

 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
     return YES;
 }
 
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [self.items removeObjectAtIndex:indexPath.row];
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {

     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count+1 inSection:0];
     NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
     [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
     [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
     [self.tableView reloadData];
 }
 }

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     id buffer = [self.items objectAtIndex:fromIndexPath.row];
     [self.items removeObjectAtIndex:fromIndexPath.row];
     [self.items insertObject:buffer atIndex:toIndexPath.row];
   
 }


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
     return YES;
 }

@end
