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

- (UIImage *)scaledToWidth:(CGFloat)newWidth
{
    return [self scaledToSize:CGSizeMake(newWidth, (self.size.height * (newWidth / self.size.width)))];
}

- (UIImage *)scaledToHeight:(CGFloat)newHeight
{
    return [self scaledToSize:CGSizeMake((self.size.width * (newHeight / self.size.height)), newHeight)];
}

#pragma mark -

- (UIImage *)cropToSquare
{
	CGSize imageSize = self.size;
	CGFloat shortestSide = fminf(imageSize.width, imageSize.height);
	return [self scaledToSize:CGSizeMake(shortestSide, shortestSide)];
}

#pragma mark -

- (void)writeToSavedPhotosAlbum
{
    UIImageWriteToSavedPhotosAlbum(self, nil, NULL, nil);
}

@end