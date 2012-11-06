//
//  AGNavigationController.m
//  AGFoundation
//
//  Created by Andrew Garn on 16/10/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGNavigationController.h"

@implementation AGNavigationController

- (BOOL)shouldAutorotate
{
    if (self.topViewController != nil)
        return [self.topViewController shouldAutorotate];

    return [super shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (self.topViewController != nil)
        return [self.topViewController supportedInterfaceOrientations];
    
    return [super supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if (self.topViewController != nil)
        return [self.topViewController preferredInterfaceOrientationForPresentation];
        
        return [super preferredInterfaceOrientationForPresentation];
}

@end