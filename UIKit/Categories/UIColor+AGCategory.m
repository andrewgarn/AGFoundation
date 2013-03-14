//
//  UIColor+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 20/04/2012.
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

#import "UIColor+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(UIColor_AGCategory);
#endif

@implementation UIColor (AGCategory)

#pragma mark - Creating a Random UIColor

+ (UIColor *)randomColor_AG 
{
    CGFloat red =  (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

#pragma mark - Creating a UIColor Object from Component Values

+ (UIColor *)colorWithHex_AG:(int)hexValue
{
    return [UIColor colorWithHex_AG:hexValue alpha:1.0];
}

+ (UIColor *)colorWithHex_AG:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

#pragma mark - Creating a UIColor with Preset Component Values

/**
 *  Additional UIColor shades
 *	Reference: http://iphonedevelopment.blogspot.co.uk/2008/10/little-color-in-your-life.html
 */ 

+ (UIColor *)indigoColor_AG
{
    return [UIColor colorWithRed:0.294f green:0.0f blue:0.509f alpha:1.0];
}

+ (UIColor *)tealColor_AG
{
    return [UIColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0];
}

+ (UIColor *)violetColor_AG
{
    return [UIColor colorWithRed:0.498f green:0.0f blue:1.0f alpha:1.0];
}

+ (UIColor *)vividVioletColor_AG
{
    return [UIColor colorWithRed:0.506f green:0.0f blue:1.0f alpha:1.0];
}

+ (UIColor *)darkVioletColor_AG
{
    return [UIColor colorWithRed:0.58f green:0.0f blue:0.827f alpha:1.0];
}

+ (UIColor *)amberColor_AG
{
    return [UIColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0];
}

+ (UIColor *)darkAmberColor_AG
{
    return [UIColor colorWithRed:1.0f green:0.494f blue:0.0f alpha:1.0];
}

+ (UIColor *)lemonColor_AG
{
    return [UIColor colorWithRed:1.0f green:0.914f blue:0.0627f alpha:1.0];
}

+ (UIColor *)roseColor_AG
{
    return [UIColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0];
}

+ (UIColor *)rubyColor_AG
{
    return [UIColor colorWithRed:0.8784f green:0.06667f blue:0.3725f alpha:1.0];
}

+ (UIColor *)fireEngineRed_AG
{
    return [UIColor colorWithRed:0.8078f green:0.0863f blue:0.1255f alpha:1.0];
}

#pragma mark - Retrieving Color Information

- (CGFloat)redComponent_AG 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[0];
}

- (CGFloat)greenComponent_AG 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[1];
}


- (CGFloat)blueComponent_AG 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[2];
}

- (CGFloat)alphaComponent_AG 
{
	return CGColorGetAlpha(self.CGColor);
}

@end