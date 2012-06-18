//
//  NSDictionary+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSDictionary+AGCategory.h"
#import "NSObject+AGCategory.h"

@implementation NSDictionary (AGCategory)

- (BOOL)boolForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(boolValue)])
        return [object intValue];
    
    return NO;
}

- (int)intForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(intValue)])
        return [object intValue];
    
    return 0;
}

- (float)floatForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(floatValue)])
        return [object floatValue];
    
    return 0;
}

- (double)doubleForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(doubleValue)])
        return [object doubleValue];
    
    return 0;
}

- (NSInteger)integerForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object respondsToSelector:@selector(integerValue)])
        return [object integerValue];
    
    return 0;
}

#pragma mark -

- (NSDate *)dateForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSDate class]])
        return object;
    
    return nil;
}

- (NSString *)stringForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSString class]])
        return object;
    
    if ([object respondsToSelector:@selector(stringValue)])
        return [object stringValue];
    
    return nil;
}

- (NSNumber *)numberForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSNumber class]])
        return object;
    
    if ([object respondsToSelector:@selector(doubleValue)])
        return [NSNumber numberWithDouble:[object doubleValue]];
    
    return nil;
}

- (NSArray *)arrayForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSArray class]])
        return object;
    
    return nil;
}

- (NSDictionary *)dictionaryForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSDictionary class]])
        return object;
    
    return nil;
}

#pragma mark -

- (BOOL)isEmpty
{
    return ![self isNotEmpty];
}

- (BOOL)isNotEmpty
{
	return [self count] == 0 ? YES : NO;
}

- (BOOL)containsObjectForKey:(id)aKey 
{
	return [[self allKeys] containsObject:aKey];
}

- (NSArray *)allKeysSorted
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

@end