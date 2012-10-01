//
//  UIBarButtonItem+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
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

#import <UIKit/UIKit.h>

typedef void (^AGCategoryBarButtonItemSenderBlock)(UIBarButtonItem *sender);

/** A collection of category extensions for `UIBarButtonItem` */
@interface UIBarButtonItem (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Creating Bar Buttons
 ---------------------------------------------------------------------------------------
*/

/** Creates and returns a new bar button using a custom view containing a standard button object.
 @param image The image to use for the normal state.
 @param highlightedImage The image to use for the highlighted state.
 @param block The block object called when the bar button is pressed.
 @return Newly initialized bar button item with the specified properties.
*/ 
+ (UIBarButtonItem *)customButtonWithImage_AG:(UIImage *)image highlightedImage:(UIImage *)highlightedImage block:(AGCategoryBarButtonItemSenderBlock)block;

@end