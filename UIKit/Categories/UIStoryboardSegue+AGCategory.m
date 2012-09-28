//
//  UIStoryboardSegue+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 28/09/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIStoryboardSegue+AGCategory.h"

@implementation UIStoryboardSegue (AGCategory)

- (UIViewController *)destinationTopViewController
{
    id destinationViewController = self.destinationViewController;
    if ([destinationViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = destinationViewController;
        return navigationController.topViewController;
    }
    return destinationViewController;
}

@end