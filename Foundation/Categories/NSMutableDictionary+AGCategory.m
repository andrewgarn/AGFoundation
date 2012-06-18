//
//  NSMutableDictionary+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 08/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSMutableDictionary+AGCategory.h"

@implementation NSMutableDictionary (AGCategory)

#pragma mark -

- (void)setBool:(BOOL)value forKey:(id)key
{
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

#pragma mark -

- (void)setInt:(BOOL)value forKey:(id)key
{
    [self setObject:[NSNumber numberWithInt:value] forKey:key];
}

- (void)setFloat:(BOOL)value forKey:(id)key
{
    [self setObject:[NSNumber numberWithFloat:value] forKey:key];
}

- (void)setDouble:(BOOL)value forKey:(id)key
{
    [self setObject:[NSNumber numberWithDouble:value] forKey:key];
}

- (void)setInteger:(BOOL)value forKey:(id)key
{
    [self setObject:[NSNumber numberWithInteger:value] forKey:key];
}

@end