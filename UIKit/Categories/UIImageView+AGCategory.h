//
//  UIImageView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIImageView` */
@interface UIImageView (AGCategory)

/** Returns an image view initialized with the specified filename.
 @param imageName The name of the file. If this is the first time the image is being loaded, the method looks for an image with the specified name in the application’s main bundle.
 @return An image view initialized with the specified filename.
*/ 
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName;

@end