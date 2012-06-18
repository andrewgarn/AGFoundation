//
//  UserDefaultsManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UserDefaultsManager.h"

@implementation UserDefaultsManager
@synthesize userDefaults = _userDefaults;

#pragma mark - Object Lifecycle

- (id)init
{
    if ((self = [super init]))
    {
        if([NSUbiquitousKeyValueStore defaultStore])
        {
            // Save a local reference to NSUserDefaults
            _userDefaults = [NSUserDefaults standardUserDefaults];
            
            // Add NSUbiquitousKeyValueStoreDidChangeExternally observer
            if(NSClassFromString(@"NSUbiquitousKeyValueStore"))
            {
                if([NSUbiquitousKeyValueStore defaultStore])
                {
                    [[NSNotificationCenter defaultCenter] addObserver:self 
                                                             selector:@selector(keyValueStoreDidChangeExternally:) 
                                                                 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification 
                                                               object:nil];
                }
            }
            
            // Add NSUserDefaultsDidChange notification observer.
            [[NSNotificationCenter defaultCenter] addObserver:self 
                                                     selector:@selector(userDefaultsDidChange:) 
                                                         name:NSUserDefaultsDidChangeNotification                                                 
                                                       object:nil];
        }
    }
    return self;
}

#pragma mark - NSUbiquitousKeyValueStore Notifications

- (void)keyValueStoreDidChangeExternally:(NSNotification *)notification
{
    // Grab the key value store from iCloud
    NSUbiquitousKeyValueStore *keyValueStore = [NSUbiquitousKeyValueStore defaultStore];
    NSDictionary *dictionary = [keyValueStore dictionaryRepresentation];
    
    // Remove the NSUserDefaultsDidChangeNotification temporarily.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUserDefaultsDidChangeNotification object:nil];
    
    // Update the local NSUserDefaults using the iCloud data.
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    }];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // Add the NSUserDefaultsDidChangeNotification back.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(userDefaultsDidChange:) 
                                                 name:NSUserDefaultsDidChangeNotification                                                    
                                               object:nil];
    
    // Notify observers that NSUserDefaults has been updated
    [[NSNotificationCenter defaultCenter] postNotificationName:AGUserDefaultsDidChangeNotification object:nil userInfo:nil];
}

- (void)userDefaultsDidChange:(NSNotification *)notification
{
    if(NSClassFromString(@"NSUbiquitousKeyValueStore"))
    {
        if([NSUbiquitousKeyValueStore defaultStore])
        {
            // Update the iCloud key value store using NSUserDefault data
            NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
            [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
                [[NSUbiquitousKeyValueStore defaultStore] setObject:obj forKey:key];
            }];
            [[NSUbiquitousKeyValueStore defaultStore] synchronize];
        }
    }
}

//#pragma mark - Constants
NSString * const AGUserDefaultsDidChangeNotification = @"AGUserDefaultsDidChangeNotification";

#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_IMPLEMENTATION(UserDefaultsManager, sharedManager);

@end