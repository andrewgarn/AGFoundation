//
//  UIScreen+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIScreen+AGCategory.h"
#import <QuartzCore/QuartzCore.h>

@interface UIScreen (AGCategory_Private)
- (UIImage *)screenshot;
@end

#pragma mark -

@implementation UIScreen (AGCategory)

+ (UIImage *)screenshot
{
    return [[UIScreen mainScreen] screenshot]; 
}

- (UIImage *)screenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) 
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark -

+ (CGFloat)pixelWidth
{
    return [UIScreen pixelBounds].size.width;
}

+ (CGFloat)pixelHeight
{
    return [UIScreen pixelBounds].size.height;
}

+ (CGRect)pixelBounds
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    bounds.size.width = bounds.size.width * scale;
    bounds.size.height = bounds.size.height;
    return bounds;
}

#pragma mark -

+ (CGFloat)pointWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)pointHeight
{
    return [[UIScreen mainScreen] bounds].size.height;    
}

#pragma mark -

- (CGRect)currentBounds 
{
	return [self boundsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (CGRect)boundsForOrientation:(UIInterfaceOrientation)orientation
{
	CGRect bounds = [self bounds];
    
	if (UIInterfaceOrientationIsLandscape(orientation)) 
    {
		CGFloat buffer = bounds.size.width;
		bounds.size.width = bounds.size.height;
		bounds.size.height = buffer;
	}
	return bounds;
}

@end