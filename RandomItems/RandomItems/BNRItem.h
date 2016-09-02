//
//  BNRItem.h
//  RandomItems
//
//  Created by Eduardo on 9/1/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

{
    // Instance variables
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

// + symbol signifies a CLASS method
+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

// Getters and Setters
- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;



@end
