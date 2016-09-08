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

@implementation KCKItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[KCKItemStore sharedStore] createItem];
        }
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
    // Create an instance of UITableViewCell, with default appearance
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:@"UITableViewCell"];
    
    // Set the text on the cell with the description of the item that is at the nth index of
    // items, where n = row this cell will appear in on the tableView
    NSArray *items = [[KCKItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

@end
