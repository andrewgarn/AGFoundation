//
//  AGTabBarController.m
//  AGFoundation
//
//  Created by Andrew Garn on 10/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGTabBarController.h"

@implementation AGTabBarController

#pragma mark - iOS 5

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (self.selectedViewController)
        return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

#pragma mark - iOS 6

- (BOOL)shouldAutorotate
{
    if (self.selectedViewController != nil)
        return [self.selectedViewController shouldAutorotate];
    
    return [super shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (self.selectedViewController != nil)
        return [self.selectedViewController supportedInterfaceOrientations];
    
    return [super supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if (self.selectedViewController != nil)
        return [self.selectedViewController preferredInterfaceOrientationForPresentation];
    
    return [super preferredInterfaceOrientationForPresentation];
}

@end