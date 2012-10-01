//
//  UIImage+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 26/03/2012.
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

#import <Foundation/Foundation.h>
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
- (UIImage *)scaledToSize_AG:(CGSize)newSize;

/** Returns the receiver scaled then cropped to the specified size.
 @param newSize The size to scale then crop the image to.
 @return The receiver scaled then cropped to the specified size.
 */ 
- (UIImage *)scaledAndCroppedToSize_AG:(CGSize)newSize;

/** Returns the receiver scaled then cropped to the specified size.
 
 HiDPI scaling is ignored and the image returned is exactly the specified size.
 @param newSize The size to scale then crop the image to.
 @return The receiver scaled then cropped to the specified size.
 */ 
- (UIImage *)scaledAndCroppedToAbsoluteSize_AG:(CGSize)newSize;

/** Returns the receiver scaled then cropped to the specified size with the specified HiDPI scale.
 @param newSize The size to scale and then crop the image to.
 @param scale The HiDPI scale to use when scaling the image.
 @return The receiver scaled then cropped to the specified size.
*/ 
- (UIImage *)scaledAndCroppedToSize_AG:(CGSize)newSize withScale:(CGFloat)scale;

/** Returns the receiver scaled to the specified width.
 @param newWidth The width to scale the image to.
 @return The receiver scaled to the specified width.
*/ 
- (UIImage *)scaledToWidth_AG:(CGFloat)newWidth;

/** Returns the receiver scaled to the specified height.
 @param newHeight The height to scale the image to.
 @return The receiver scaled to the specified height.
*/ 
- (UIImage *)scaledToHeight_AG:(CGFloat)newHeight;

/**-------------------------------------------------------------------------------------
 @name Cropping
 ---------------------------------------------------------------------------------------
*/

/** Returns the receiver cropped into a square format.
 @return The receiver cropped into a square format.
*/ 
- (UIImage *)croppedToSquare_AG;

/**-------------------------------------------------------------------------------------
 @name Retrieval
 ---------------------------------------------------------------------------------------
*/

/** Creates and returns an image object by loading the image data associated with the specified filename in the main bundle.
 
 This method does not cache the image object.
 @param filename The name of the file, including extension.
 @return A new image object for the specified file, or nil if the method could not initialize the image from the specified file.
*/ 
+ (UIImage *)imageWithContentsOfBundleFileNamed_AG:(NSString *)filename;

/** Creates and returns an image object by loading the image data associated with the specified filename in the documents folder.
 
 This method does not cache the image object.
 @param filename The name of the file, including extension.
 @return A new image object for the specified file, or nil if the method could not initialize the image from the specified file.
 */ 
+ (UIImage *)imageWithContentsOfDocumentFileNamed_AG:(NSString *)filename;

@end