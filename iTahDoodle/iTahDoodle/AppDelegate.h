//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Eduardo on 8/30/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

// Declare a helper function that you will use to get a path to the location on
// disk where you can save the to-do list
NSString *DocPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

// Views
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

// Model
@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end

