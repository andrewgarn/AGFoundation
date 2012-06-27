//
//  UIImage+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 26/03/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIImage+AGCategory.h"

@implementation UIImage (AGCategory)

- (UIImage *)scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, 1.0f, 0.0f);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaledAndCroppedToSize:(CGSize)newSize
{
    return [self scaledAndCroppedToSize:newSize withScale:0.0f];  // using 0.0f forces to use native scaling.
}

- (UIImage *)scaledAndCroppedToAbsoluteSize:(CGSize)newSize
{
    return [self scaledAndCroppedToSize:newSize withScale:1.0f];
}

- (UIImage *)scaledAndCroppedToSize:(CGSize)newSize withScale:(CGFloat)scale
{
    CGFloat scaleFactor, scaledWidth, scaledHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(self.size, newSize) == NO) 
    {
        CGFloat widthFactor = newSize.width / self.size.width;
        CGFloat heightFactor = newSize.height / self.size.height;
        
        if (widthFactor > heightFactor) 
            scaleFactor = widthFactor;  // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        
        scaledWidth  = self.size.width * scaleFactor;
        scaledHeight = self.size.height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
            thumbnailPoint.y = (newSize.height - scaledHeight) * 0.5; 
        else 
            if (widthFactor < heightFactor)
                thumbnailPoint.x = (newSize.width - scaledWidth) * 0.5;
    }       
    
    UIGraphicsBeginImageContextWithOptions(newSize, 1.0f, scale);
    [self drawInRect:CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledWidth, scaledHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)scaledToWidth:(CGFloat)newWidth
{
    return [self scaledToSize:CGSizeMake(newWidth, (self.size.height * (newWidth / self.size.width)))];
}

- (UIImage *)scaledToHeight:(CGFloat)newHeight
{
    return [self scaledToSize:CGSizeMake((self.size.width * (newHeight / self.size.height)), newHeight)];
}

#pragma mark -

- (UIImage *)croppedToSquare
{
	CGSize imageSize = self.size;
	CGFloat shortestSide = fminf(imageSize.width, imageSize.height);
	return [self scaledAndCroppedToSize:CGSizeMake(shortestSide, shortestSide)];
}

#pragma mark -

- (void)writeToSavedPhotosAlbum
{
    UIImageWriteToSavedPhotosAlbum(self, nil, NULL, nil);
}

@end