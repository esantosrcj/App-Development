//
//  KCKItemsViewController.m
//  Homepwner
//
//  Created by Eduardo on 9/8/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "KCKItemsViewController.h"
#import "KCKItemStore.h"
#import "BNRItem.h"
#import "KCKDetailViewController.h"

@interface KCKItemsViewController ()

@end

@implementation KCKItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        // Create a new bar button item that will send addNewItem: to KCKItemsViewController
        //
        // Programmatically set up a target-action pair
        // The target: KCKItemsViewController
        // The action: addNewItem:
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(addNewItem:)];
        
        // Set this bar button item as the right item in the navigationItem
        navItem.rightBarButtonItem = bbi;
        
        // Edit button
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    
    
    return self;
}

// Override the superclass's designated initializer
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

// tableView:numberOfRowsInSection: returns an integer value for the number of rows
// that the UITableView should display
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[KCKItemStore sharedStore] allItems] count];
}

// This method will create a cell, set its textLabel to the description of the corresponding
// BNRItem, and return it to the UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item that is at the nth index of
    // items, where n = row this cell will appear in on the tableView
    NSArray *items = [[KCKItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    //UIView *header = self.headerView;
    //[self.tableView setTableHeaderView:header];
}

- (IBAction)addNewItem:(id)sender
{
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[KCKItemStore sharedStore] createItem];
    
    // Figure out where that item is in the array
    NSInteger lastRow = [[[KCKItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // Insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
    
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[KCKItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[KCKItemStore sharedStore] removeItem:item];
        
        // Also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath
      toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    [[KCKItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    KCKDetailViewController *detailViewController = [[KCKDetailViewController alloc] init];
    
    NSArray *items = [[KCKItemStore sharedStore] allItems];
    BNRItem *selectedItem = items[indexPath.row];
    
    // Give detail view controller a pointer to the item object in row
    detailViewController.item = selectedItem;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

@end
