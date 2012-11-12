//
//  UINavigationController+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 12/11/2012.
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

/** A collection of category extensions for `UINavigationController` */
@interface UINavigationController (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Pushing Stack Items
 ---------------------------------------------------------------------------------------
*/

/** Pushes a view controller onto the receiver’s stack with the specified transition and updates the display.
 @param viewController The view controller that is pushed onto the stack.
 @param transition The transition to apply to the view controller during the push animation.
*/ 
- (void)pushViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition;

/** Pushes a view controller onto the receiver’s stack with the specified transition and updates the display.
 @param viewController The view controller that is pushed onto the stack.
 @param transition The transition to apply to the view controller during the push animation.
 @param duration The interval of time to be used as the duration of the animation.
*/
- (void)pushViewController:(UIViewController *)viewController
            withTransition:(UIViewAnimationTransition)transition
              withDuration:(NSTimeInterval)duration;

/**-------------------------------------------------------------------------------------
 @name Popping Stack Items
 ---------------------------------------------------------------------------------------
*/

/** Pops the top view controller from the navigation stack with the specified transition and updates the display.
 @param transition The transition to apply to the view controller during the pop animation.
*/
- (void)popViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition;

/** Pops the top view controller from the navigation stack with the specified transition and updates the display.
 @param transition The transition to apply to the view controller during the pop animation.
 @param duration The interval of time to be used as the duration of the animation.
*/
- (void)popViewController:(UIViewController *)viewController
           withTransition:(UIViewAnimationTransition)transition
             withDuration:(NSTimeInterval)duration;

@end