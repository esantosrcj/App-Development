//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Eduardo on 8/30/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Views
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

// Model
@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end

