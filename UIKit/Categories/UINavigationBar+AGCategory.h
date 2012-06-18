//
//  UINavigationBar+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/** A collection of category extensions for `UINavigationBar` */
@interface UINavigationBar (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Customizing the Bar Appearance
 ---------------------------------------------------------------------------------------
*/

/** Adds a default drop shadow to the receiver.
@see addDropShadowWithOffset:radius:color:opacity:
*/ 
- (void)addDropShadow;

/** Adds a drop shadow to the receiver with the specified parameters.
 @param offset Specifies the offset of the receiver’s shadow.
 @param radius Specifies the radius of the receiver’s shadow.
 @param color Specifies the color of the receiver’s shadow.
 @param opacity Specifies the opacity of the receiver’s shadow.
*/ 
- (void)addDropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity;

@end