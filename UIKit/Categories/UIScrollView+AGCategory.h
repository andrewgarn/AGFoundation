//
//  UIScrollView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIScrollView` */
@interface UIScrollView (AGCategory)

/** Scroll to the top of the receiver's content view with animation. */
- (void)scrollToTop;

/** Scroll to the top of the receiver's content view. 
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 */ 
- (void)scrollToTopAnimated:(BOOL)animated;

/** Scroll to the bottom of the receiver's content view with animation. */
- (void)scrollToBottom;

/** Scroll to the bottom of the receiver's content view.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

@end