//
//  UIImage+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 26/03/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIImage` */
@interface UIImage (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Scaling
 ---------------------------------------------------------------------------------------
*/

/** Returns the receiver scaled to the specified size.
 @param newSize The size to scale the image to.
 @return The receiver scaled to the specified size.
*/ 
- (UIImage *)scaledToSize:(CGSize)newSize;

/** Returns the receiver scaled to the specified width.
 @param newWidth The width to scale the image to.
 @return The receiver scaled to the specified width.
*/ 
- (UIImage *)scaledToWidth:(CGFloat)newWidth;

/** Returns the receiver scaled to the specified height.
 @param newHeight The height to scale the image to.
 @return The receiver scaled to the specified height.
*/ 
- (UIImage *)scaledToHeight:(CGFloat)newHeight;

/**-------------------------------------------------------------------------------------
 @name Cropping
 ---------------------------------------------------------------------------------------
*/

/** Returns the receiver cropped into a square format.
 @return The receiver cropped into a square format.
*/ 
- (UIImage *)cropToSquare;

@end