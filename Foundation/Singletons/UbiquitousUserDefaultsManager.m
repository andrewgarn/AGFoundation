//
//  UbiquitousUserDefaultsManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "UbiquitousUserDefaultsManager.h"
NSString * const AGUserDefaultsDidChangeExternallyNotification = @"AGUserDefaultsDidChangeExternallyNotification";

@interface UbiquitousUserDefaultsManager ()
@property (nonatomic, strong) NSSet *ubiquitousKeys;
@end

#pragma mark -

@implementation UbiquitousUserDefaultsManager

#pragma mark -

- (BOOL)start
{
    NSAssert(_ubiquitousKeys != nil, @"Missing ubiquitousKeys");
    
    if(NSClassFromString(@"NSUbiquitousKeyValueStore")) {
        if([NSUbiquitousKeyValueStore defaultStore]) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyValueStoreDidChangeExternally:)
                                                         name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:nil];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:)
                                                         name:NSUserDefaultsDidChangeNotification object:nil];
            return YES;
        }
    }
    return NO;
}

#pragma mark - NSUbiquitousKeyValueStore

- (void)keyValueStoreDidChangeExternally:(NSNotification *)notification
{    
    // Grab the key value store from iCloud
    NSUbiquitousKeyValueStore *keyValueStore = [NSUbiquitousKeyValueStore defaultStore];
    NSDictionary *dictionary = [keyValueStore dictionaryRepresentation];
    
    // Remove the NSUserDefaultsDidChangeNotification temporarily.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUserDefaultsDidChangeNotification object:nil];
    
    // Update the local NSUserDefaults using the iCloud data.
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([_ubiquitousKeys containsObject:key]) {
            [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
        }
    }];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // Add the NSUserDefaultsDidChangeNotification back.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(userDefaultsDidChange:) 
                                                 name:NSUserDefaultsDidChangeNotification                                                    
                                               object:nil];
    
    // Notify observers that NSUserDefaults has been updated externally.
    [[NSNotificationCenter defaultCenter] postNotificationName:AGUserDefaultsDidChangeExternallyNotification object:nil userInfo:nil];
}

#pragma mark - NSUserDefaults

- (void)userDefaultsDidChange:(NSNotification *)notification
{
    if([NSUbiquitousKeyValueStore defaultStore]) {
        // Update the iCloud key value store using NSUserDefault data
        NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([_ubiquitousKeys containsObject:key]) {
                [[NSUbiquitousKeyValueStore defaultStore] setObject:obj forKey:key];
            }
        }];
        [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    }
}

#pragma mark - Singleton

+ (UbiquitousUserDefaultsManager *)sharedManager
{
    static UbiquitousUserDefaultsManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[UbiquitousUserDefaultsManager alloc] init];
    });
    return sharedManager; 
}

@end