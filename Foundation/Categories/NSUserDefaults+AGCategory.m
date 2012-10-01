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

+ (BOOL)boolForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] boolForKey:defaultName];
}

+ (float)floatForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] floatForKey:defaultName];
}

+ (double)doubleForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] doubleForKey:defaultName];
}

+ (NSInteger)integerForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] integerForKey:defaultName];
}

#pragma mark -

+ (id)objectForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] objectForKey:defaultName];
}

+ (NSURL *)URLForKey_AG:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults_AG] URLForKey:defaultName];
}

+ (NSData *)dataForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] dataForKey:defaultName];
}

+ (NSArray *)arrayForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] arrayForKey:defaultName];
}

+ (NSString *)stringForKey_AG:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults_AG] stringForKey:defaultName];
}

+ (NSArray *)stringArrayForKey_AG:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults_AG] stringArrayForKey:defaultName];
}

+ (NSDictionary *)dictionaryForKey_AG:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults_AG] dictionaryForKey:defaultName];
}

#pragma mark -

+ (void)setBool_AG:(BOOL)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setFloat_AG:(float)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setFloat:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setDouble_AG:(double)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setDouble:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setInteger_AG:(NSInteger)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setInteger:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setObject_AG:(id)object forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:object forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setURL_AG:(NSURL *)url forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setURL:url forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setData_AG:(NSData *)data forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:data forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setArray_AG:(NSArray *)array forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:array forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setString_AG:(NSString *)string forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:string forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setStringArray_AG:(NSArray *)stringArray forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:stringArray forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

+ (void)setDictionary_AG:(NSDictionary *)dictionary forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setObject:dictionary forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

#pragma mark - UIColor

+ (UIColor *)colorForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] colorForKey_AG:defaultName];
}

- (UIColor *)colorForKey_AG:(NSString *)defaultName
{
    NSData *data = [self dataForKey:defaultName];
    UIColor *color = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    if ([color isKindOfClass:[UIColor class]]) 
        return color;
    
	return nil;
}

+ (void)setColor_AG:(UIColor *)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setColor_AG:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)setColor_AG:(UIColor *)value forKey:(NSString *)defaultName
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
    [self setObject:data forKey:defaultName];
}

#pragma mark - NSRange

+ (NSRange)rangeForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] rangeForKey_AG:defaultName];
}

- (NSRange)rangeForKey_AG:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return NSRangeFromString(string);
    
    return NSMakeRange(0, 0);
}

+ (void)setRange_AG:(NSRange)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setRange_AG:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)setRange_AG:(NSRange)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromRange(value) forKey:defaultName];
}

#pragma mark - CGPoint

+ (CGPoint)pointForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] pointForKey_AG:defaultName];
}

- (CGPoint)pointForKey_AG:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGPointFromString(string);

    return CGPointZero;
}

+ (void)setPoint_AG:(CGPoint)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setPoint_AG:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)setPoint_AG:(CGPoint)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGPoint(value) forKey:defaultName];
}

#pragma mark - CGSize

+ (CGSize)sizeForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] sizeForKey_AG:defaultName];
}

- (CGSize)sizeForKey_AG:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGSizeFromString(string);
    
    return CGSizeZero;
}

+ (void)setSize_AG:(CGSize)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setSize_AG:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)setSize_AG:(CGSize)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGSize(value) forKey:defaultName];
}

#pragma mark - CGRect

+ (CGRect)rectForKey_AG:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults_AG] rectForKey_AG:defaultName];
}

- (CGRect)rectForKey_AG:(NSString *)defaultName
{
    NSString *string = [self objectForKey:defaultName];
    if ([string isKindOfClass:[NSString class]])
        return CGRectFromString(string);
    
    return CGRectZero;
}

+ (void)setRect_AG:(CGRect)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults_AG] setRect_AG:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)setRect_AG:(CGRect)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGRect(value) forKey:defaultName];
}

#pragma mark -

+ (NSUserDefaults *)standardUserDefaults_AG
{
    static dispatch_once_t token;
	static NSUserDefaults *standardUserDefaults;
    
	dispatch_once(&token, ^{
		standardUserDefaults = [NSUserDefaults standardUserDefaults];
	});
	return standardUserDefaults;
}

#pragma mark -

+ (void)synchronizeQueued_AG
{
    [[NSUserDefaults standardUserDefaults_AG] synchronizeQueued_AG];
}

- (void)synchronizeQueued_AG
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(synchronize) object:nil];
    [self performSelector:@selector(synchronize) withObject:nil afterDelay:0];
}

@end