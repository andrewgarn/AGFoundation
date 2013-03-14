//
//  UIImage+AGCategory.m
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

#import "UIImage+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(UIImage_AGCategory);
#endif

@implementation UIImage (AGCategory)

#pragma mark -

- (CGFloat)pixelWidth_AG
{
    return [self pixelSize_AG].width;
}

- (CGFloat)pixelHeight_AG
{
    return [self pixelSize_AG].height;
}

- (CGSize)pixelSize_AG
{
    CGSize pixelSize = CGSizeZero;
    pixelSize.width = self.size.width * self.scale;
    pixelSize.height = self.size.height * self.scale;
    return pixelSize;
}

#pragma mark -

- (UIImage *)scaledToSize_AG:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, 1.0f, 0.0f);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaledAndCroppedToSize_AG:(CGSize)newSize
{
    return [self scaledAndCroppedToSize_AG:newSize withScale:0.0f];  // using 0.0f forces to use native scaling.
}

- (UIImage *)scaledAndCroppedToAbsoluteSize_AG:(CGSize)newSize
{
    return [self scaledAndCroppedToSize_AG:newSize withScale:1.0f];
}

- (UIImage *)scaledAndCroppedToSize_AG:(CGSize)newSize withScale:(CGFloat)scale
{
    CGFloat scaleFactor, scaledWidth = newSize.width, scaledHeight = newSize.height;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(self.size, newSize) == NO) {
        CGFloat widthFactor = newSize.width / self.size.width;
        CGFloat heightFactor = newSize.height / self.size.height;
        
        if (widthFactor > heightFactor) 
            scaleFactor = widthFactor;  // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        
        scaledWidth  = self.size.width * scaleFactor;
        scaledHeight = self.size.height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (newSize.height - scaledHeight) * 0.5; 
        } else {
            if (widthFactor < heightFactor) {
                thumbnailPoint.x = (newSize.width - scaledWidth) * 0.5;
            }
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(newSize, YES, scale);
    [self drawInRect:CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledWidth, scaledHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)scaledToWidth_AG:(CGFloat)newWidth
{
    return [self scaledToSize_AG:CGSizeMake(newWidth, (self.size.height * (newWidth / self.size.width)))];
}

- (UIImage *)scaledToHeight_AG:(CGFloat)newHeight
{
    return [self scaledToSize_AG:CGSizeMake((self.size.width * (newHeight / self.size.height)), newHeight)];
}

#pragma mark -

- (UIImage *)croppedToSquare_AG
{
	CGSize imageSize = self.size;
	CGFloat shortestSide = fminf(imageSize.width, imageSize.height);
	return [self scaledAndCroppedToSize_AG:CGSizeMake(shortestSide, shortestSide)];
}

#pragma mark -

+ (UIImage *)imageWithContentsOfBundleFileNamed_AG:(NSString *)filename
{
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)imageWithContentsOfDocumentFileNamed_AG:(NSString *)filename
{
    static dispatch_once_t token;
	static NSString *documentPath;
    
	dispatch_once(&token, ^{
		documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];	
	});
    
    NSString *path = [documentPath stringByAppendingPathComponent:filename];
    return [UIImage imageWithContentsOfFile:path];
}

@end