//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Eduardo on 9/6/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "HypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

@end
