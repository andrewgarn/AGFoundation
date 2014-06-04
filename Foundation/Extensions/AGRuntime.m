//
//  AGRuntime.m
//  AGFoundation
//
//  Created by Andrew Garn on 30/11/2013.
//  Copyright (c) 2013 Andrew Garn. All rights reserved.
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

#import "AGRuntime.h"
#import <objc/runtime.h>

@implementation AGRuntime

#pragma mark - Available Classes

+ (NSArray *)availableClassList
{
    NSMutableArray *availableClasses = [NSMutableArray array];
    
    int numClasses = objc_getClassList(NULL, 0);;
    Class *classes = NULL;
    
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            Class class = classes[i];
            NSString *className = [NSString stringWithCString:class_getName(class) encoding:NSUTF8StringEncoding];
            [availableClasses addObject:className];
        }
        free(classes);
    }
    
    if ([availableClasses count] > 0) {
        [availableClasses sortUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    
    return [availableClasses copy];
}

+ (NSArray *)availableClassesWithPrefix:(NSString *)prefix
{
    NSMutableArray *availableClasses = [NSMutableArray array];
    
    int numClasses = objc_getClassList(NULL, 0);;
    Class *classes = NULL;
    
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            Class class = classes[i];
            NSString *className = [NSString stringWithCString:class_getName(class) encoding:NSUTF8StringEncoding];
            if ([className hasPrefix:prefix]) {
                [availableClasses addObject:className];
            }
        }
        free(classes);
    }
    
    if ([availableClasses count] > 0) {
        [availableClasses sortUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    
    return [availableClasses copy];
}

#pragma mark - Subclasses

static inline BOOL classIsSubclassOfClass(Class subclass, Class superclass)
{
	for (Class class = class_getSuperclass(subclass); class != Nil; class = class_getSuperclass(class)) {
		if (class == superclass) {
			return YES;
        }
	}
	return NO;
}

+ (NSSet *)subclassListForClass:(Class)aClass
{
	static void *AGRuntimeSubclassListKey = &AGRuntimeSubclassListKey;
	NSMutableSet *subclasses = objc_getAssociatedObject(aClass, AGRuntimeSubclassListKey);
	if (subclasses == nil) {
		subclasses = [[NSMutableSet alloc] init];
		unsigned int count = 0;
		Class *classes = objc_copyClassList(&count);
		for (int i = 0; i < count; i++) {
			Class class = classes[i];
			// Do not use -[NSObject isSubclassOfClass:] in order to avoid calling +initialize on all classes
			if (classIsSubclassOfClass(class, aClass)) {
				[subclasses addObject:class];
            }
		}
		free(classes);
		objc_setAssociatedObject(aClass, AGRuntimeSubclassListKey, subclasses, OBJC_ASSOCIATION_COPY);
	}
	return subclasses;
}

#pragma mark - Properties

+ (NSArray *)propertyListForClass:(Class)aClass
{
    return [AGRuntime propertyListForClass:aClass withPrefix:nil];
}

+ (NSArray *)propertyListForClass:(Class)aClass withPrefix:(NSString *)prefix
{
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(aClass, &propertyCount);
    
    NSMutableArray *allPropertyNames = [NSMutableArray arrayWithCapacity:propertyCount];
    for (NSUInteger i = 0; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
        const char *propertyNameChar = property_getName(property);
        
        if (propertyNameChar) {
            NSString *propertyName = [NSString stringWithCString:propertyNameChar encoding:NSUTF8StringEncoding];
            [allPropertyNames addObject:propertyName];
        }
    }
    free(propertyList);
    
    Class superclass = class_getSuperclass(aClass);
    if (prefix != nil || [NSStringFromClass(superclass) hasPrefix:prefix]) {
        NSArray *subclassPropertyList = [AGRuntime propertyListForClass:[superclass class] withPrefix:prefix];
        [allPropertyNames addObjectsFromArray:subclassPropertyList];
    }
    
    return [NSArray arrayWithArray:allPropertyNames];
}

+ (BOOL)propertyDefinedAsWeak:(NSString *)propertyName onClass:(Class)aClass
{
    BOOL propertyDefinedAsWeak = NO;
    objc_property_t property = class_getProperty(aClass, [propertyName UTF8String]);
    if (property) {
        propertyDefinedAsWeak = (property_getAttributes(property)[3] == 'W');
    }
    return propertyDefinedAsWeak;
}

#pragma mark - Methods

+ (NSArray *)methodListForClassName:(NSString *)className
{
    Class class = NSClassFromString(className);
    if (class == nil) return nil;
    
    NSArray *methodList = [AGRuntime methodListForClass:class];
    return methodList;
}

+ (NSArray *)methodListForClass:(Class)aClass
{
    NSMutableArray *methodList = [[NSMutableArray alloc] init];
    
    unsigned int methodCount;
    Method *methods = class_copyMethodList(aClass, &methodCount);
    
    if (methods != nil) {
        methodList = [NSMutableArray arrayWithCapacity:methodCount];
        
        for (int i = 0; i < methodCount; i++) {
            NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(methods[i])) encoding:NSASCIIStringEncoding];
            [methodList addObject:methodName];
        }
        
        free(methods);
    }
    
    // Sort the method list by name
    [methodList sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    return methodList;
}

@end