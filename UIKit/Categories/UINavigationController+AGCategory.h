//
//  UINavigationController+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 04/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum
{
    AGViewControllerAnimationNone,
    AGViewControllerAnimationFlipFromLeft,
    AGViewControllerAnimationFlipFromRight,
    AGViewControllerAnimationCurlUp,
    AGViewControllerAnimationCurlDown,
    AGViewControllerAnimationFadeIn,
    AGViewControllerAnimationMoveIn,
    AGViewControllerAnimationPush,
    AGViewControllerAnimationReveal
} AGViewControllerAnimation;

#define AGViewControllerAnimationSubtypeFromRight kCATransitionFromRight
#define AGViewControllerAnimationSubtypeFromLeft kCATransitionFromLeft
#define AGViewControllerAnimationSubtypeFromTop kCATransitionFromTop
#define AGViewControllerAnimationSubtypeFromBottom kCATransitionFromBottom

/** A collection of category extensions for `UINavigationController` */
@interface UINavigationController (AGCategory)

/** Pushes a view controller onto the receiver’s stack with animation and updates the display.
 
 Code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param viewController The view controller that is pushed onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops a view controller from the receiver’s stack with animation and updates the display.
 
 Code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops the receiver’s stack to the root view controller with animation and updates the display.
 
 Code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popToRootViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops the receiver’s stack to the specified view controller with animation and updates the display.
 
 Code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param viewController The view controller that is pushed onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

@end