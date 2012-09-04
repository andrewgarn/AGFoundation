//
//  NSString+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/04/2012.
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

#import "NSString+AGCategory.h"
#import "NSURL+AGCategory.h"

#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

@implementation NSString (AGCategory)

- (BOOL)isNotEmpty
{
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
        return NO;
    
    return YES;
}

#pragma mark -

- (BOOL)containsString:(NSString *)aString 
{
    if ([self rangeOfString:aString].location != NSNotFound)
        return YES;
    
    return NO;
}

- (NSArray *)rangesOfString:(NSString *)aString
{
    NSMutableArray *rangeArray = [[NSMutableArray alloc] init];
    NSUInteger length = [self length];
    NSRange range = NSMakeRange(0, length);
    
    while(range.location != NSNotFound)
    {
        range = [self rangeOfString:aString options:0 range:range];
        if(range.location != NSNotFound)
        {
            [rangeArray addObject:[NSValue valueWithRange:range]];
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
        }
    }
    return rangeArray;
}

#pragma mark -

- (NSString *)reversedString
{
    NSUInteger stringLength = [self length];
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:stringLength];     
    while (stringLength > 0)
    {
        stringLength--;
        [reversedString appendString:[NSString stringWithFormat:@"%C", [self characterAtIndex:stringLength]]];
    }
    return reversedString;
}

#pragma mark -

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; 
}

- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet
{
    NSRange rangeOfFirstWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]];
    if (rangeOfFirstWantedCharacter.location != NSNotFound) 
        return [self substringFromIndex:rangeOfFirstWantedCharacter.location];

    return self;
}

- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters
{
    return [self stringByTrimmingLeadingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet 
{
    NSRange rangeOfLastWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet] options:NSBackwardsSearch];
    if (rangeOfLastWantedCharacter.location != NSNotFound)
        return [self substringToIndex:rangeOfLastWantedCharacter.location + 1];

    return self;
}

- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters
{
    return [self stringByTrimmingTrailingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark -

- (NSString *)urlEncodedString
{
    CFStringRef encoded = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                  (__bridge CFStringRef)self,
                                                                  NULL,
                                                                  CFSTR(":/?#[]@!$&'()*+,;="),
                                                                  kCFStringEncodingUTF8);
    return [NSString stringWithString:(__bridge_transfer NSString *)encoded];
}

- (NSString *)urlDecodedString
{
    CFStringRef decoded = CFURLCreateStringByReplacingPercentEscapes( kCFAllocatorDefault,
                                                                     (__bridge CFStringRef)self,
                                                                     CFSTR(":/?#[]@!$&'()*+,;=") );
    return [NSString stringWithString:(__bridge_transfer NSString *)decoded];
}

#pragma mark -

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    return [self heightWithFont:font constrainedToWidth:width min:0];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width min:(CGFloat)minHeight
{
    return [self heightWithFont:font constrainedToWidth:width lineBreakMode:UILineBreakModeWordWrap min:minHeight];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size min:(CGFloat)minHeight
{
    return [self heightWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap min:minHeight];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode
{
    return [self heightWithFont:font constrainedToWidth:width lineBreakMode:lineBreakMode min:0];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode min:(CGFloat)minHeight
{
    CGSize constraint = CGSizeMake(width, CGFLOAT_MAX);
    return [self heightWithFont:font constrainedToSize:constraint lineBreakMode:lineBreakMode min:minHeight];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(UILineBreakMode)lineBreakMode min:(CGFloat)minHeight
{
    CGFloat height = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode].height;
    return ((height < minHeight) ? minHeight : (height > size.height) ? size.height : height);
}

#pragma mark -

- (BOOL)isValidEmailAddress
{
    static dispatch_once_t onceToken;
	static NSRegularExpression *regularExpression;
    
	dispatch_once(&onceToken, ^{
		NSString *regexPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$";
        NSRegularExpressionOptions options = NSRegularExpressionCaseInsensitive;
        regularExpression = [[NSRegularExpression alloc] initWithPattern:regexPattern options:options error:nil];
	});
    
    NSRange range = NSMakeRange(0, [self length]);
    NSUInteger regexMatches = [regularExpression numberOfMatchesInString:self options:0 range:range];
    
    if (regexMatches == 0)
        return NO;
    
    return YES;
}

- (BOOL)isAlphaNumeric
{
    static dispatch_once_t onceToken;
	static NSCharacterSet *unwantedCharacters;
    
	dispatch_once(&onceToken, ^{
		unwantedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
	});
    
    return ([self rangeOfCharacterFromSet:unwantedCharacters].location == NSNotFound);
}

#pragma mark -

+ (NSString *)UUIDStringCreate
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    return uuidStr;
}

#pragma mark -

- (BOOL)addSkipBackupAttribute
{
    NSURL *fileURL = [NSURL fileURLWithPath:self];
    if (fileURL) return [fileURL addSkipBackupAttribute];
    return NO;
}

#pragma mark -

- (NSString *)MD5Hash
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString *)SHA1Hash
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString *)SHA256Hash
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString *)SHA512Hash
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

- (NSString *)HMACWithSecret:(NSString *)secret
{
    CCHmacContext    ctx;
    const char       *key = [secret UTF8String];
    const char       *str = [self UTF8String];
    unsigned char    mac[CC_MD5_DIGEST_LENGTH];
    char             hexmac[2 * CC_MD5_DIGEST_LENGTH + 1];
    char             *p;
    
    CCHmacInit( &ctx, kCCHmacAlgMD5, key, strlen( key ));
    CCHmacUpdate( &ctx, str, strlen(str) );
    CCHmacFinal( &ctx, mac );
    
    p = hexmac;
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) {
        snprintf( p, 3, "%02x", mac[ i ] );
        p += 2;
    }
    
    return [NSString stringWithUTF8String:hexmac];
}

@end