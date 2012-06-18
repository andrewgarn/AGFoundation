//
//  UIScreen+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 03/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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