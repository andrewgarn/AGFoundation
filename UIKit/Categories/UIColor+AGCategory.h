//
//  UIColor+AGCategory.h
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