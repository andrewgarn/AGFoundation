//
//  UINavigationController+AGCategory.m
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

#import "UINavigationController+AGCategory.h"

@implementation UINavigationController (AGCategory)

- (void)pushViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype 
{
    switch (transition)
    {
        case AGViewControllerAnimationNone:
        {
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromLeft:
        {
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromRight:
        {
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlUp:
        {
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlDown:
        {
            [self standardAnimationWithController:viewController duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self pushViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFadeIn:
        {
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationMoveIn:
        {
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationPush:
        {
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationReveal:
        {
            [self coreAnimationWithController:viewController duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self pushViewController:viewController animated:NO];
                                 }];
            
        }
            break;
    }
}

#pragma mark -

- (void)popViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype 
{
    switch (transition)
    {
        case AGViewControllerAnimationNone:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromLeft:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromRight:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlUp:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlDown:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFadeIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationMoveIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationPush:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationReveal:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popViewControllerAnimated:NO];
                                 }];
        }
            break;
    }
}

- (void)popToRootViewControllerWithCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype 
{
    switch (transition) 
    {
        case AGViewControllerAnimationNone:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromLeft:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromRight:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlUp:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlDown:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToRootViewControllerAnimated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFadeIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationMoveIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationPush:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationReveal:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToRootViewControllerAnimated:NO];
                                 }];
        }
            break;
    }    
}

- (void)popToViewController:(UIViewController *)viewController withCustomTransition:(AGViewControllerAnimation)transition subtype:(NSString *)subtype 
{
    switch (transition)
    {
        case AGViewControllerAnimationNone:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionNone
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromLeft:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFlipFromRight:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlUp:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlUp
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationCurlDown:
        {
            [self standardAnimationWithController:nil duration:.5 options:UIViewAnimationOptionTransitionCurlDown
                                     changesBlock:^{
                                         [self popToViewController:viewController animated:NO];
                                     }];
        }
            break;
            
        case AGViewControllerAnimationFadeIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionFade subtype:nil
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationMoveIn:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionMoveIn subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationPush:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionPush subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
        }
            break;
            
        case AGViewControllerAnimationReveal:
        {
            [self coreAnimationWithController:nil duration:.5 type:kCATransitionReveal subtype:subtype
                                 changesBlock:^{
                                     [self popToViewController:viewController animated:NO];
                                 }];
        }
            break;
    }        
}

#pragma mark - Private

- (void)standardAnimationWithController:(UIViewController*)viewController
                               duration:(NSTimeInterval)duration
                                options:(UIViewAnimationOptions)options
                           changesBlock:(void (^)(void))block
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView transitionWithView:self.view duration:duration options:options animations:block completion:NULL];
    [UIView commitAnimations];
}

- (void)coreAnimationWithController:(UIViewController*)viewController
                           duration:(NSTimeInterval)duration
                               type:(NSString*)type
                            subtype:(NSString*)subtype
                       changesBlock:(void (^)(void))block
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:duration];
    [transition setType:type];
    [transition setSubtype:subtype];
    [self.view.layer addAnimation:transition forKey:kCATransition];
    block();
}

int const kAGAnimationDuration = 0.5;

@end