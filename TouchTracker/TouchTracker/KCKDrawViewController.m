//
//  KCKDrawViewController.m
//  TouchTracker
//
//  Created by Eduardo on 9/14/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "KCKDrawViewController.h"
#import "KCKDrawView.h"

@implementation KCKDrawViewController

- (void)loadView
{
    self.view = [[KCKDrawView alloc] initWithFrame:CGRectZero];
}

@end
