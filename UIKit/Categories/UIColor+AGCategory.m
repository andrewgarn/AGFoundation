//
//  UIColor+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 20/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIColor+AGCategory.h"

@implementation UIColor (AGCategory)

#pragma mark - Construction

+ (UIColor *)randomColor 
{
    CGFloat red =  (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

#pragma mark - 

/**
 *  Additional UIColor shades
 *	Reference: http://iphonedevelopment.blogspot.co.uk/2008/10/little-color-in-your-life.html
 */ 

+ (UIColor *)indigoColor
{
    return [UIColor colorWithRed:0.294f green:0.0f blue:0.509f alpha:1.0];
}

+ (UIColor *)tealColor
{
    return [UIColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0];
}

+ (UIColor *)violetColor
{
    return [UIColor colorWithRed:0.498f green:0.0f blue:1.0f alpha:1.0];
}

+ (UIColor *)vividVioletColor
{
    return [UIColor colorWithRed:0.506f green:0.0f blue:1.0f alpha:1.0];
}

+ (UIColor *)darkVioletColor
{
    return [UIColor colorWithRed:0.58f green:0.0f blue:0.827f alpha:1.0];
}

+ (UIColor *)amberColor
{
    return [UIColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0];
}

+ (UIColor *)darkAmberColor
{
    return [UIColor colorWithRed:1.0f green:0.494f blue:0.0f alpha:1.0];
}

+ (UIColor *)lemonColor
{
    return [UIColor colorWithRed:1.0f green:0.914f blue:0.0627f alpha:1.0];
}

+ (UIColor *)roseColor
{
    return [UIColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0];
}

+ (UIColor *)rubyColor
{
    return [UIColor colorWithRed:0.8784f green:0.06667f blue:0.3725f alpha:1.0];
}

+ (UIColor *)fireEngineRed
{
    return [UIColor colorWithRed:0.8078f green:0.0863f blue:0.1255f alpha:1.0];
}

#pragma mark - Components

- (CGFloat)red 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB)
    {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[0];
}

- (CGFloat)green 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) 
    {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[1];
}


- (CGFloat)blue 
{
	CGColorRef color = self.CGColor;
	if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) 
    {
		return -1.0f;
	}
	CGFloat const *components = CGColorGetComponents(color);
	return components[2];
}

- (CGFloat)alpha 
{
	return CGColorGetAlpha(self.CGColor);
}

@end