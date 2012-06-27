//
//  NSArray+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSArray+AGCategory.h"

@implementation NSArray (AGCategory)

- (id)firstObject
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0)
        return [self objectAtIndex:0];

    return nil;
}

- (id)randomObject
{
    if ([self respondsToSelector:@selector(count)] && [self count] > 0)
        return [self objectAtIndex:arc4random() % [self count]];

	return nil;
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)sortedArrayUsingSortDescriptorKey:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (NSArray *)reversedArray 
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) 
    {
        [array addObject:element];
    }
    return array;
}

@end