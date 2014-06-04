//
//  UIView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
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

#import "UIView+AGCategory.h"
#import <QuartzCore/QuartzCore.h>

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(UIView_AGCategory);
#endif

@implementation UIView (AGCategory)

#pragma mark - UIImage

- (UIImage *)imageRepresentation_AG
{
    CGSize imageSize = [self bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    }
    
	if([self.layer respondsToSelector:@selector(setShouldRasterize:)]) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.contentScaleFactor);
    } else {
		UIGraphicsBeginImageContext(self.bounds.size);
	}
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return image;
}

#pragma mark -

- (void)setRoundedCornersWithRadius_AG:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color
{
	self.clipsToBounds = YES;
	self.layer.cornerRadius = radius;
	self.layer.borderWidth = width;
    
	if (color) {
		self.layer.borderColor = color.CGColor;
	}
}

#pragma mark - Logging

- (void)logViewHierarchy_AG
{
    NSLog(@"**** Log View Hierarchy: START ****");
    
    [self logViewHierarchy_AG:self depth:0];
    
    NSLog(@"**** Log View Hierarchy: END ****");
}

- (void)logViewHierarchy_AG:(UIView *)viewNode depth:(NSUInteger)depth
{
    for (UIView *v in viewNode.subviews) {
        NSLog(@"%@%@", [@"" stringByPaddingToLength:depth withString:@"|-" startingAtIndex:0], [v description]);
        
        if ([v.subviews count]) {
            [self logViewHierarchy_AG:v depth:(depth + 2)];
        }
    }
}

#pragma mark - Animation

- (void)removeFromSuperviewAnimated_AG
{
    [self removeFromSuperviewAnimatedWithCompletion_AG:nil];
}

- (void)removeFromSuperviewAnimatedWithCompletion_AG:(void (^)(BOOL finished))completion
{
    __block CGFloat originalAlpha = self.alpha;
    [UIView animateWithDuration:0.3f animations:^{
        [self setAlpha:0];
    } completion:^ (BOOL finished) {
        [self removeFromSuperview];
        [self setAlpha:originalAlpha];
        if (completion) completion(finished);
    }];
}

#pragma mark -

- (void)removeAllSubviews_AG
{
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)removeAllSubviewsAnimated_AG
{
    [self removeAllSubviewsAnimatedWithCompletion_AG:nil];
}

- (void)removeAllSubviewsAnimatedWithCompletion_AG:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.3f animations:^{
        [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    } completion:^(BOOL finished) {
        if (completion) completion(finished);
    }];
}

#pragma mark - Bounds

- (CGRect)currentBounds_AG 
{
	return [self boundsForOrientation_AG:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (CGRect)boundsForOrientation_AG:(UIInterfaceOrientation)orientation
{
	CGRect bounds = [self bounds];
    
	if (UIInterfaceOrientationIsLandscape(orientation)) {
		CGFloat buffer = bounds.size.width;
		bounds.size.width = bounds.size.height;
		bounds.size.height = buffer;
	}
	return bounds;
}

#pragma mark - Frame

- (CGPoint)origin_AG
{
    return self.frame.origin;
}

- (void)setOrigin_AG:(CGPoint)newOrigin
{
    CGRect frame = self.frame;
    frame.origin = newOrigin;
    self.frame = frame;
}

- (CGFloat)originX_AG
{
    return self.frame.origin.x;
}

- (void)setOriginX_AG:(CGFloat)newX
{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

- (CGFloat)originY_AG
{
    return self.frame.origin.y; 
}

- (void)setOriginY_AG:(CGFloat)newY
{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

#pragma mark -

- (CGFloat)minX_AG
{
    return CGRectGetMinX(self.frame);
}

- (void)setMinX_AG:(CGFloat)minX
{
    CGRect frame = self.frame;
    frame.origin.x = minX;
    self.frame = frame;
}

- (CGFloat)midX_AG
{
    return CGRectGetMidX(self.frame);
}

- (void)setMidX_AG:(CGFloat)midX
{
    CGRect frame = self.frame;
    frame.origin.x = midX - (frame.size.width / 2);
    self.frame = frame;
}

- (CGFloat)maxX_AG
{
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxX_AG:(CGFloat)maxX
{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)minY_AG
{
    return CGRectGetMinY(self.frame);
}

- (void)setMinY_AG:(CGFloat)minY
{
    CGRect frame = self.frame;
    frame.origin.y = minY;
    self.frame = frame;
}

- (CGFloat)midY_AG
{
    return CGRectGetMidY(self.frame);
}

- (void)setMidY_AG:(CGFloat)midY
{
    CGRect frame = self.frame;
    frame.origin.y = midY - (frame.size.height / 2);
    self.frame = frame;
}

- (CGFloat)maxY_AG
{
    return CGRectGetMaxY(self.frame);
}

- (void)setMaxY_AG:(CGFloat)maxY
{
    CGRect frame = self.frame;
    frame.origin.y = maxY - frame.size.height;
    self.frame = frame;
}

#pragma mark -

- (CGSize)size_AG
{
    return self.bounds.size;
}

- (void)setSize_AG:(CGSize)newSize
{
    CGRect bounds = self.bounds;
    bounds.size = newSize;
    self.bounds = bounds;
}

- (CGFloat)width_AG
{
    return self.bounds.size.width;
}

- (void)setWidth_AG:(CGFloat)newWidth
{
    CGRect bounds = self.bounds;
    bounds.size.width = newWidth;
    self.bounds = bounds;
}

- (CGFloat)height_AG
{
    return self.bounds.size.height;
}

- (void)setHeight_AG:(CGFloat)newHeight
{
    CGRect bounds = self.bounds;
    bounds.size.height = newHeight;
    self.bounds = bounds;
}

@end