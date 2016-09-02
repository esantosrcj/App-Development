//
//  main.m
//  RandomItems
//
//  Created by Eduardo on 9/1/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a mutable arrya object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        // Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}
