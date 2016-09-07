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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    
    return self;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
}

@end
