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
 @name Configuring Position
 ---------------------------------------------------------------------------------------
*/

/** Shortcut for the receiver's frame.origin property. */ 
@property (nonatomic) CGPoint origin;

/** Shortcut for the receiver's frame.origin.x property. */
@property (nonatomic) CGFloat x;

/** Shortcut for the receiver's frame.origin.y property. */
@property (nonatomic) CGFloat y;

/**-------------------------------------------------------------------------------------
 @name Configuring Size
 ---------------------------------------------------------------------------------------
*/

/** Shortcut for the receiver's frame.size property. */ 
@property (nonatomic) CGSize size;

/** Shortcut for the receiver's frame.size.width property. */
@property (nonatomic) CGFloat width;

/** Shortcut for the receiver's frame.size.height property. */
@property (nonatomic) CGFloat height;

/**-------------------------------------------------------------------------------------
 @name Configuring Min, Mid, and Max Values
 ---------------------------------------------------------------------------------------
*/

/** Shortcut for the receiver's frame.origin.x property. */
@property (nonatomic) CGFloat minX;

/** Shortcut for the receiver's frame.origin.x + (frame.size.width / 2) value. */
@property (nonatomic) CGFloat midX;

/** Shortcut for the receiver's frame.origin.x + frame.size.width value. */
@property (nonatomic) CGFloat maxX;

/** Shortcut for the receiver's frame.origin.y property. */
@property (nonatomic) CGFloat minY;

/** Shortcut for the receiver's frame.origin.y + (frame.size.height / 2) value. */
@property (nonatomic) CGFloat midY;

/** Shortcut for the receiver's frame.origin.y + frame.size.height value. */
@property (nonatomic) CGFloat maxY;

@end