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

/** Returns the receiver scaled then cropped to the specified size.
 @param newSize The size to scale then crop the image to.
 @return The receiver scaled then cropped to the specified size.
 */ 
- (UIImage *)scaledAndCroppedToSize:(CGSize)newSize;

/** Returns the receiver scaled then cropped to the specified size.
 
 HiDPI scaling is ignored and the image returned is exactly the specified size.
 @param newSize The size to scale then crop the image to.
 @return The receiver scaled then cropped to the specified size.
 */ 
- (UIImage *)scaledAndCroppedToAbsoluteSize:(CGSize)newSize;

/** Returns the receiver scaled then cropped to the specified size with the specified HiDPI scale.
 @param newSize The size to scale and then crop the image to.
 @param scale The HiDPI scale to use when scaling the image.
 @return The receiver scaled then cropped to the specified size.
*/ 
- (UIImage *)scaledAndCroppedToSize:(CGSize)newSize withScale:(CGFloat)scale;

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
- (UIImage *)croppedToSquare;

@end