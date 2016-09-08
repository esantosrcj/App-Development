//
//  KCKItemStore.h
//  Homepwner
//
//  Created by Eduardo on 9/8/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface KCKItemStore : NSObject

@property (nonatomic, readonly)NSArray *allItems;

// Notice that this is a CLASS method and prefixed with a + instead of a -
+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
