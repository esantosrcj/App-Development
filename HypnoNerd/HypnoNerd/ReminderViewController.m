//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Eduardo on 9/6/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
