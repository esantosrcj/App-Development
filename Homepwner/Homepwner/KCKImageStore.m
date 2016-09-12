//
//  KCKImageStore.m
//  Homepwner
//
//  Created by Eduardo on 9/12/16.
//  Copyright © 2016 Red Rojo. All rights reserved.
//

#import "KCKImageStore.h"

@interface KCKImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation KCKImageStore

+ (instancetype)sharedStore
{
    static KCKImageStore *sharedStore = nil;
    
    if (!sharedStore) {
        
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// No one should call init
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"User +[KCKImageStore sharedStore]"
                                 userInfo:nil];
    
    return nil;
}

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    //[self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    //return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}

@end
