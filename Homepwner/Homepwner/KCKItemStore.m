//
//  KCKItemStore.m
//  Homepwner
//
//  Created by Eduardo on 9/8/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "KCKItemStore.h"
#import "BNRItem.h"

@interface KCKItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation KCKItemStore

+ (instancetype)sharedStore
{
    static KCKItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programmer calls [[KCKItemStore alloc] ini], let him know the
// error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[KCKItemStore sharedStore]"
                                 userInfo:nil];
    
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

@end
