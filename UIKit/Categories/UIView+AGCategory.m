//
//  UIView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIView+AGCategory.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (AGCategory)

#pragma mark - UIImage

- (UIImage *)image
{
    CGSize imageSize = [self bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    
	if([self.layer respondsToSelector:@selector(setShouldRasterize:)])
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.contentScaleFactor);
    }
	else
	{
		UIGraphicsBeginImageContext(self.bounds.size);
	}
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return image;
}

#pragma mark -

- (void)setRoundedCornersWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color
{
	self.clipsToBounds = YES;
	self.layer.cornerRadius = radius;
	self.layer.borderWidth = width;
    
	if (color)
	{
		self.layer.borderColor = color.CGColor;
	}
}

#pragma mark - Logging

- (void)logViewHierarchy
{
    NSLog(@"Log View Hierarchy: START");
    
    [self logViewHierarchy:self depth:0];
    
    NSLog(@"Log View Hierarchy: END");
}

- (void)logViewHierarchy:(UIView *)viewNode depth:(NSUInteger)depth
{
    for (UIView *v in viewNode.subviews)
    {
        NSLog(@"%@%@", [@"" stringByPaddingToLength:depth withString:@"|-" startingAtIndex:0], [v description]);
        
        if ([v.subviews count])
        {
            [self logViewHierarchy:v depth:(depth + 2)];
        }
    }
}

#pragma mark - Animation

- (void)removeFromSuperviewAnimated 
{
    __block float originalOpacity = self.layer.opacity;
    [UIView animateWithDuration:0.3 animations:^{
        [self.layer setOpacity:0];
    }
                     completion:^ (BOOL finished) {
                         self.layer.opacity = originalOpacity;
                         [self removeFromSuperview];
                     }];
}

#pragma mark - Bounds

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

#pragma mark - Frame

- (float)x
{
    return self.frame.origin.x;
}

- (float)y
{
    return self.frame.origin.y; 
}

- (void)setX:(float)newX
{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

- (void)setY:(float)newY
{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)height
{
    return self.frame.size.height;
}

- (void)setWidth:(float)newWidth
{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

- (void)setHeight:(float)newHeight
{
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

@end