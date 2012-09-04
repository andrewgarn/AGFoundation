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

static char kNSObjectBlockKey;

@implementation NSObject (AGCategory)

#pragma mark -

+ (NSDate *)forceDateOrNil:(id)anObject
{
    if ([anObject isKindOfClass:[NSDate class]])
        return (NSDate *)anObject;
    
    return nil;
}

+ (NSString *)forceStringOrNil:(id)anObject
{
    if ([anObject isKindOfClass:[NSString class]])
        return (NSString *)anObject;
    
    if ([anObject respondsToSelector:@selector(stringValue)])
        return [anObject stringValue];
    
    return nil;
}

+ (NSNumber *)forceNumberOrNil:(id)anObject
{
    if ([anObject isKindOfClass:[NSNumber class]])
        return (NSNumber *)anObject;
    
    if ([anObject respondsToSelector:@selector(doubleValue)])
        return [NSNumber numberWithDouble:[anObject doubleValue]];
    
    return nil;
}

#pragma mark -

- (BOOL)isNotEmpty
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

- (void)performBlock:(AGVoidBlock)aBlock
{
    [self associateCopyOfValue:aBlock withKey:&kNSObjectBlockKey];
    [self performSelector:@selector(_callBlock)];
}

- (void)performBlock:(AGVoidBlock)aBlock afterDelay:(NSTimeInterval)delay
{
    [self associateCopyOfValue:aBlock withKey:&kNSObjectBlockKey];
    [self performSelector:@selector(_callBlock) withObject:nil afterDelay:delay];
}

- (void)_callBlock
{
    AGVoidBlock block = [self associatedValueForKey:&kNSObjectBlockKey];
    if (block) block ();
}

- (void)performSelector:(SEL)aSelector afterDelay:(NSTimeInterval)delay
{
	[self performSelector:aSelector withObject:nil afterDelay:delay];
}

#pragma mark -

/**
 *  Automatic description method adapted from a StackOverflow answer by Kendall Helmstetter Geln. 2012.
 *	Reference: http://stackoverflow.com/questions/2299841/objective-c-introspection-reflection
 */
- (NSString *)automaticDescription
{
    return [NSObject autoDescribe:self classType:[self class]];
}

+ (NSString *) autoDescribe:(id)instance classType:(Class)classType
{
    NSUInteger count;
    objc_property_t *propList = class_copyPropertyList(classType, &count);
    NSMutableString *propPrint = [NSMutableString string];
    
    for ( int i = 0; i < count; i++ )
    {
        objc_property_t property = propList[i];
        
        const char *propName = property_getName(property);
        NSString *propNameString = [NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        if(propName) 
        {
            id value = [instance valueForKey:propNameString];
            
            if (NSClassFromString(@"NSManagedObject") && [value isKindOfClass:NSClassFromString(@"NSManagedObject")])
                [propPrint appendString:[NSString stringWithFormat:@"%@=%@ ; ", propNameString, [value class]]];
            else
                [propPrint appendString:[NSString stringWithFormat:@"%@=%@ ; ", propNameString, value]];
        }
    }
    free(propList);
    
    
    // Now see if we need to map any superclasses as well.
    Class superClass = class_getSuperclass( classType );
    if ( superClass != nil && ! [superClass isEqual:[NSObject class]] )
    {
        NSString *superString = [self autoDescribe:instance classType:superClass];
        [propPrint appendString:superString];
    }
    
    return propPrint;
}

+ (NSString *)autoDescribe:(id)instance
{
    NSString *headerString = [NSString stringWithFormat:@"%@:%p:: ", [instance class], instance];
    return [headerString stringByAppendingString:[self autoDescribe:instance classType:[instance class]]];
}

#pragma mark -

/**
 *  Associated object methods from the BlocksKit project by Zachary Waldowski. 2012. MIT.
 *	Reference: https://github.com/zwaldowski/BlocksKit
*/

- (void)associateValue:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)associateValue:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)associateCopyOfValue:(id)value withKey:(const char *)key
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)associateCopyOfValue:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)weaklyAssociateValue:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

+ (void)weaklyAssociateValue:(id)value withKey:(const char *)key 
{
	objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedValueForKey:(const char *)key 
{
	return objc_getAssociatedObject(self, key);
}

+ (id)associatedValueForKey:(const char *)key
{
	return objc_getAssociatedObject(self, key);
}

- (void)removeAllAssociatedObjects 
{
	objc_removeAssociatedObjects(self);
}

+ (void)removeAllAssociatedObjects 
{
	objc_removeAssociatedObjects(self);
}

@end