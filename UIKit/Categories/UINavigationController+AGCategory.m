//
//  UINavigationController+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 04/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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