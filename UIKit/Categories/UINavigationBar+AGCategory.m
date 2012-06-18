//
//  UINavigationBar+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UINavigationBar+AGCategory.h"

@implementation UINavigationBar (AGCategory)

- (void)addDropShadow
{
    [self addDropShadowWithOffset:CGSizeMake(0, 3) radius:1.0 color:[UIColor darkGrayColor] opacity:1.0];
}

- (void)addDropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity
{
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    [self.layer setShadowPath:path];
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.clipsToBounds = NO;
}

@end