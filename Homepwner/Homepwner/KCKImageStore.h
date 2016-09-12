//
//  KCKImageStore.h
//  Homepwner
//
//  Created by Eduardo on 9/12/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface KCKImageStore : NSObject

// + symbol signifies a class method
+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;
@end
