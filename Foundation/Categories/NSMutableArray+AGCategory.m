//
//  NSMutableArray+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSMutableArray+AGCategory.h"

@implementation NSMutableArray (AGCategory)

- (void) enqueue:(id)anObject 
{
    [self addObject:anObject];
}

- (id)dequeue
{
     if ([self count] == 0) 
         return nil; 
    
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) 
        [self removeObjectAtIndex:0];

    return headObject;
}

- (void)push:(id)anObject
{
	[self addObject:anObject];
}

- (id)pop
{
	id result = [self lastObject];
	[self removeLastObject];
	return result;
}

- (NSMutableArray *)reverse
{    
    int i = 0;
    int j = [self count] - 1;
    
    while (i<j) 
    {
        [self exchangeObjectAtIndex:i withObjectAtIndex:j];
        i++;
        j--;
    }
    return self;
}

@end