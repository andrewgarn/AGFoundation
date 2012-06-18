//
//  UIView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIView` */
@interface UIView (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Image Rendering
 ---------------------------------------------------------------------------------------
*/

/** Creates a UIImage object representing the receiver.
 @return A UIImage object representing the receiver.
*/ 
- (UIImage *)image;

/**-------------------------------------------------------------------------------------
 @name Style Attributes
 ---------------------------------------------------------------------------------------
*/

/** Adds rounded corners to the receiver.
 @param radius The corner radius to use.
 @param width The width of the image border
 @param color The color of the image border. Optional.
*/ 
- (void)setRoundedCornersWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

/**-------------------------------------------------------------------------------------
 @name Hierarchy Logging
 ---------------------------------------------------------------------------------------
*/

/** Recursively log the receiver and its subviews. */ 
- (void)logViewHierarchy;

/**-------------------------------------------------------------------------------------
 @name Animating Views
 ---------------------------------------------------------------------------------------
*/

/** Unlinks the receiver from its superview and its window, and removes it from the responder chain with animation. */ 
- (void)removeFromSuperviewAnimated;

/**-------------------------------------------------------------------------------------
 @name Bounds for Orientation
 ---------------------------------------------------------------------------------------
*/

/** Returns the bounds rectangle of the receiver adjusted for the current status bar orientation. 
 @return The bounds rectangle of the receiver adjusted for the current status bar orientation.
 */ 
- (CGRect)currentBounds;

/** Returns the bounds rectangle of the receiver adjusted for orientation. 
 @param orientation The interface orientation to use.
 @return The bounds rectangle of the receiver adjusted for orientation.
*/ 
- (CGRect)boundsForOrientation:(UIInterfaceOrientation)orientation;

/**-------------------------------------------------------------------------------------
 @name Configuring the Bounds and Frame Rectangles
 ---------------------------------------------------------------------------------------
*/

/** Returns the x origin position for the receiver.
 @return The x origin position for the receiver
*/ 
- (float)x;

/** Returns the y origin position for the receiver.
 @return The y origin position for the receiver
*/
- (float)y;

/** Specifies the receiver’s x origin position.
@param newX A new x origin for the receiver.
*/
- (void)setX:(float)newX;

/** Specifies the receiver’s y origin position.
 @param newY A new y origin for the receiver.
*/
- (void)setY:(float)newY;

/** Returns the width value for the receiver.
 @return The width value for the receiver.
*/
- (float)width;

/** Returns the height value for the receiver.
 @return The height value for the receiver.
*/
- (float)height;

/** Specifies the receiver’s width.
 @param newWidth A new width value for the receiver.
*/
- (void)setWidth:(float)newWidth;

/** Specifies the receiver’s height.
 @param newHeight A new height value for the receiver.
*/
- (void)setHeight:(float)newHeight;

@end