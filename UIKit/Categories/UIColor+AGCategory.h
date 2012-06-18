//
//  UIColor+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 20/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIColor` */
@interface UIColor (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Creating a Random UIColor
 ---------------------------------------------------------------------------------------
 */

/** Returns a random UIColor.
@return The random UIColor color object.
*/ 
+ (UIColor *)randomColor;

/**-------------------------------------------------------------------------------------
 @name Creating a UIColor with Preset Component Values
 ---------------------------------------------------------------------------------------
*/

/** Returns a color object whose RGB values are 0.294, 0.0, and 0.509f and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)indigoColor;

/** Returns a color object whose RGB values are 0.0, 0.5, and 0.5 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)tealColor;

/** Returns a color object whose RGB values are 0.498, 0.0, and 1.0 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)violetColor;

/** Returns a color object whose RGB values are 0.506, 0.0, and 1.0 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)vividVioletColor;

/** Returns a color object whose RGB values are 0.58, 0.0, and 0.827 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)darkVioletColor;

/** Returns a color object whose RGB values are 1.0, 0.75, and 0.0 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)amberColor;

/** Returns a color object whose RGB values are 1.0, 0.494, and 0.0 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)darkAmberColor;

/** Returns a color object whose RGB values are 1.0, 0.914, and 0.0627 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)lemonColor;

/** Returns a color object whose RGB values are 1.0, 0.0, and 0.5 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)roseColor;

/** Returns a color object whose RGB values are 0.8784, 0.06667, and 0.3725 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)rubyColor;

/** Returns a color object whose RGB values are 0.8078, 0.0863, and 0.1255 and whose alpha value is 1.0.
 @return The UIColor object.
*/ 
+ (UIColor *)fireEngineRed;

/**-------------------------------------------------------------------------------------
 @name Color Components
 ---------------------------------------------------------------------------------------
*/ 

/** Returns the red component of the receiver */ 
- (CGFloat)red;

/** Returns the green component of the receiver */ 
- (CGFloat)green; 

/** Returns the blue component of the receiver */ 
- (CGFloat)blue;

/** Returns the alpha component of the receiver */ 
- (CGFloat)alpha;

@end