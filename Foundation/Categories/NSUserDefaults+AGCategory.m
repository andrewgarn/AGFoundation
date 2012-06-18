//
//  NSUserDefaults+AGCategory.m
//  Agnomical
//
//  Created by Andrew Garn on 29/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "NSUserDefaults+AGCategory.h"

@implementation NSUserDefaults (AGCategory)

#pragma mark -

+ (BOOL)boolForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}

+ (float)floatForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] floatForKey:defaultName];
}

+ (double)doubleForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] doubleForKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] integerForKey:defaultName];
}

#pragma mark -

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (NSURL *)URLForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults] URLForKey:defaultName];
}

+ (NSData *)dataForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] dataForKey:defaultName];
}

+ (NSArray *)arrayForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] arrayForKey:defaultName];
}

+ (NSString *)stringForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:defaultName];
}

+ (NSArray *)stringArrayForKey:(NSString *)defaultName;
{
    return [[NSUserDefaults standardUserDefaults] stringArrayForKey:defaultName];
}

+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName
{
	return [[NSUserDefaults standardUserDefaults] dictionaryForKey:defaultName];
}

#pragma mark -

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setFloat:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setObject:(id)object forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setURL:url forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setData:(NSData *)data forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setArray:(NSArray *)array forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setString:(NSString *)string forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setStringArray:(NSArray *)stringArray forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:stringArray forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

+ (void)setDictionary:(NSDictionary *)dictionary forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

#pragma mark - UIColor

+ (UIColor *)colorForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] colorForKey:defaultName];
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
    [[NSUserDefaults standardUserDefaults] setColor:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

- (void)setColor:(UIColor *)value forKey:(NSString *)defaultName
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
    [self setObject:data forKey:defaultName];
}

#pragma mark - NSRange

+ (NSRange)rangeForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] rangeForKey:defaultName];
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
    [[NSUserDefaults standardUserDefaults] setRange:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

- (void)setRange:(NSRange)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromRange(value) forKey:defaultName];
}

#pragma mark - CGPoint

+ (CGPoint)pointForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] pointForKey:defaultName];
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
    [[NSUserDefaults standardUserDefaults] setPoint:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

- (void)setPoint:(CGPoint)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGPoint(value) forKey:defaultName];
}

#pragma mark - CGSize

+ (CGSize)sizeForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] sizeForKey:defaultName];
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
    [[NSUserDefaults standardUserDefaults] setSize:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

- (void)setSize:(CGSize)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGSize(value) forKey:defaultName];
}

#pragma mark - CGRect

+ (CGRect)rectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] rectForKey:defaultName];
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
    [[NSUserDefaults standardUserDefaults] setRect:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronizeQueued];
}

- (void)setRect:(CGRect)value forKey:(NSString *)defaultName
{
    [self setObject:NSStringFromCGRect(value) forKey:defaultName];
}

#pragma mark -

+ (void)synchronizeQueued
{
    NSLog(@"+ (void)synchronizeQueued");
    [[NSUserDefaults standardUserDefaults] synchronizeQueued]; 
}

- (void)synchronizeQueued
{
    NSLog(@"- (void)synchronizeQueued");
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(synchronize) object:nil];
    [self performSelector:@selector(synchronize) withObject:nil afterDelay:0];
}

@end