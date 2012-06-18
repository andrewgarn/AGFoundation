//
//  UIFont+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIFont` */
@interface UIFont (AGCategory)

/** Returns a dictionary representation of the fonts currently installed on the device.
 
 Code from a blog post by Nick Forge: http://forgecode.net/2010/08/uifont-name-grabber/
 @return A dictionary representation of the fonts currently installed on the device
*/ 
+ (NSDictionary *)fontsByFamilyName;

@end