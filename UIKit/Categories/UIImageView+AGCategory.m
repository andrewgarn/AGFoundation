//
//  UIImageView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 10/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIImageView+AGCategory.h"

@implementation UIImageView (AGCategory)

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]]; 
}

@end