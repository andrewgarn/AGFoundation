//
//  UIScreen+AGCategory.h
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

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIScreen` */
@interface UIScreen (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Screenshot
 ---------------------------------------------------------------------------------------
*/

/** Returns a image representation of the application's window. 
 @return An image representation of the application's window.
*/ 
+ (UIImage *)screenshot;

/**-------------------------------------------------------------------------------------
 @name Pixel Dimensions
 ---------------------------------------------------------------------------------------
*/

/** Returns the pixel width of the main screen.
 @return The pixel width of the main screen.
*/ 
+ (CGFloat)pixelWidth;

/** Returns the pixel height of the main screen.
 @return The pixel height of the main screen.
*/  
+ (CGFloat)pixelHeight;

/**-------------------------------------------------------------------------------------
 @name Point Dimensions
 ---------------------------------------------------------------------------------------
*/

/** Returns the point width of the main screen.
 @return The point width of the main screen.
*/
+ (CGFloat)pointWidth;

/** Returns the point height of the main screen.
 @return The point height of the main screen.
*/
+ (CGFloat)pointHeight;

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

@end