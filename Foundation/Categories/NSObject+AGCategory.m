//
//  NSObject+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 16/05/2012.
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

#import "NSObject+AGCategory.h"
#import <objc/runtime.h>

@implementation NSObject (AGCategory)

#pragma mark -

+ (NSDate *)forceDateOrNil_AG:(id)anObject
{
    if ([anObject isKindOfClass:[NSDate class]])
        return (NSDate *)anObject;
    
    return nil;
}

+ (NSString *)forceStringOrNil_AG:(id)anObject
{
    if ([anObject isKindOfClass:[NSString class]])
        return (NSString *)anObject;
    
    if ([anObject respondsToSelector:@selector(stringValue)])
        return [anObject stringValue];
    
    return nil;
}

+ (NSNumber *)forceNumberOrNil_AG:(id)anObject
{
    if ([anObject isKindOfClass:[NSNumber class]])
        return (NSNumber *)anObject;
    
    if ([anObject respondsToSelector:@selector(doubleValue)])
        return [NSNumber numberWithDouble:[anObject doubleValue]];
    
    return nil;
}

#pragma mark -

- (BOOL)isNotEmpty_AG
{
    if ([self isKindOfClass:[NSNull class]])
        return NO;
    
    if ([self respondsToSelector:@selector(length)] && [(id)self length] == 0)  // NSString
        return NO;
    
    if ([self respondsToSelector:@selector(count)] && [(id)self count] == 0)    // NSArray, NSDictionary
        return NO;
    
    return YES;
}

#pragma mark -

- (void)performSelector_AG:(SEL)aSelector afterDelay:(NSTimeInterval)delay
{
	[self performSelector:aSelector withObject:nil afterDelay:delay];
}

#pragma mark -

/**
 *  Associated object methods from the BlocksKit project by Zachary Waldowski. 2012. MIT.
 *	Reference: https://github.com/zwaldowski/BlocksKit
*/

- (void)associateValue_AG:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)associateValue_AG:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)associateCopyOfValue_AG:(id)value withKey:(const char *)key
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)associateCopyOfValue_AG:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)weaklyAssociateValue_AG:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

+ (void)weaklyAssociateValue_AG:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedValueForKey_AG:(const char *)key 
{
	return objc_getAssociatedObject(self, key);
}

+ (id)associatedValueForKey_AG:(const char *)key
{
	return objc_getAssociatedObject(self, key);
}

- (void)removeAllAssociatedObjects_AG 
{
	objc_removeAssociatedObjects(self);
}

+ (void)removeAllAssociatedObjects_AG 
{
	objc_removeAssociatedObjects(self);
}

@end