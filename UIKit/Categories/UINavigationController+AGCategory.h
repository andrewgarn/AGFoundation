//
//  UINavigationController+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 04/06/2012.
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
 
 Includes code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param viewController The view controller that is pushed onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops a view controller from the receiver’s stack with animation and updates the display.
 
 Includes code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops the receiver’s stack to the root view controller with animation and updates the display.
 
 Includes code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popToRootViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

/** Pops the receiver’s stack to the specified view controller with animation and updates the display.
 
 Includes code from StackOverflow answer by Lawicko: http://stackoverflow.com/questions/9480458/change-animation-transition
 @param viewController The view controller that is pushed onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 @param transition The custom transition to use for the animation.
 @param subtype The custom animation subtype to use for the animation.
*/ 
- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype;

@end