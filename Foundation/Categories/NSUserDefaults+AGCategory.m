//
//  NSUserDefaults+AGCategory.m
//  Agnomical
//
//  Created by Andrew Garn on 29/05/2012.
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

#import "NSUserDefaults+AGCategory.h"

@implementation NSUserDefaults (AGCategory)

#pragma mark -

+ (BOOL)boolForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] boolForKey:defaultName];
}

+ (float)floatForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] floatForKey:defaultName];
}

+ (double)doubleForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] doubleForKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] integerForKey:defaultName];
}

#pragma mark -

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] objectForKey:defaultName];
}

+ (NSURL *)URLForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults staticUserDefaults] URLForKey:defaultName];
}

+ (NSData *)dataForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] dataForKey:defaultName];
}

+ (NSArray *)arrayForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] arrayForKey:defaultName];
}

+ (NSString *)stringForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults staticUserDefaults] stringForKey:defaultName];
}

+ (NSArray *)stringArrayForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults staticUserDefaults] stringArrayForKey:defaultName];
}

+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName
{
	return [[NSUserDefaults staticUserDefaults] dictionaryForKey:defaultName];
}

#pragma mark -

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setFloat:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setObject:(id)object forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:object forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setURL:url forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setData:(NSData *)data forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:data forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setArray:(NSArray *)array forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:array forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setString:(NSString *)string forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:string forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setStringArray:(NSArray *)stringArray forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:stringArray forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

+ (void)setDictionary:(NSDictionary *)dictionary forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setObject:dictionary forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

#pragma mark - UIColor

+ (UIColor *)colorForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] colorForKey:defaultName];
}

- (UIColor *)colorForKey:(NSString *)defaultName 
{
    NSData *data = [self dataForKey:defaultName];
    UIColor *color = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    if ([color isKindOfClass:[UIColor class]]) 
        return color;
    
	return nil;
}

+ (void)setColor:(UIColor *)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setColor:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)setColor:(UIColor *)value forKey:(NSString *)defaultName
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
    [self setObject:data forKey:defaultName];
}

#pragma mark - NSRange

+ (NSRange)rangeForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] rangeForKey:defaultName];
}

- (NSRange)rangeForKey:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return NSRangeFromString(string);
    
    return NSMakeRange(0, 0);
}

+ (void)setRange:(NSRange)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setRange:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)setRange:(NSRange)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromRange(value) forKey:defaultName];
}

#pragma mark - CGPoint

+ (CGPoint)pointForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] pointForKey:defaultName];
}

- (CGPoint)pointForKey:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGPointFromString(string);

    return CGPointZero;
}

+ (void)setPoint:(CGPoint)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setPoint:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)setPoint:(CGPoint)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGPoint(value) forKey:defaultName];
}

#pragma mark - CGSize

+ (CGSize)sizeForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] sizeForKey:defaultName];
}

- (CGSize)sizeForKey:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGSizeFromString(string);
    
    return CGSizeZero;
}

+ (void)setSize:(CGSize)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setSize:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)setSize:(CGSize)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGSize(value) forKey:defaultName];
}

#pragma mark - CGRect

+ (CGRect)rectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults staticUserDefaults] rectForKey:defaultName];
}

- (CGRect)rectForKey:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGRectFromString(string);
    
    return CGRectZero;
}

+ (void)setRect:(CGRect)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults staticUserDefaults] setRect:value forKey:defaultName];
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)setRect:(CGRect)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGRect(value) forKey:defaultName];
}

#pragma mark -

+ (NSUserDefaults *)staticUserDefaults
{
    static dispatch_once_t token;
	static NSUserDefaults *userDefaults;
    
	dispatch_once(&token, ^{
		userDefaults = [NSUserDefaults standardUserDefaults];
	});
	return userDefaults;
}

#pragma mark -

+ (void)synchronizeQueued
{
    NSLog(@"+ (void)synchronizeQueued");
    [[NSUserDefaults staticUserDefaults] synchronizeQueued];
}

- (void)synchronizeQueued
{
    NSLog(@"- (void)synchronizeQueued");
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(synchronize) object:nil];
    [self performSelector:@selector(synchronize) withObject:nil afterDelay:0];
}

@end