//
//  UIBarButtonItem+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIBarButtonItemSenderBlock)(id sender);

/** A collection of category extensions for `UIBarButtonItem` */
@interface UIBarButtonItem (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Creating Bar Buttons
 ---------------------------------------------------------------------------------------
*/

/** Creates and returns a new bar button using specified system item.
 @param systemItem The system item to use as the bar button image.
 @param block The block object called when the bar button is pressed.
 @return Newly initialized bar button item with the specified properties.
*/ 
+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem)systemItem block:(UIBarButtonItemSenderBlock)block;

/** Creates and returns a new bar button using the specified image.
 @param image The item’s image. If nil an image is not displayed.
 @param style The style of the item.
 @param block The block object called when the bar button is pressed.
 @return Newly initialized bar button item with the specified properties.
*/ 
+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block;

/** Creates and returns a new bar button using the specified title and other properties.
 @param title The item’s title. If nil a title is not displayed.
 @param style The style of the item.
 @param block The block object called when the bar button is pressed.
 @return Newly initialized bar button item with the specified properties.
*/ 
+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block;

/** Creates and returns a new bar button using a custom view containing a standard button object.
 @param image The image to use for the normal state.
 @param highlightedImage The image to use for the highlighted state.
 @param block The block object called when the bar button is pressed.
 @return Newly initialized bar button item with the specified properties.
*/ 
+ (UIBarButtonItem *)customButtonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage block:(UIBarButtonItemSenderBlock)block;

@end