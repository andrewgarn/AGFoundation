//
//  UIBarButtonItem+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
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

#import "UIBarButtonItem+AGCategory.h"
#import "NSObject+AGCategory.h"

static char AGCategoryBarButtonItemBlockKey;

@implementation UIBarButtonItem (AGCategory)

+ (UIBarButtonItem *)customButtonWithImage_AG:(UIImage *)image highlightedImage:(UIImage *)highlightedImage block:(AGCategoryBarButtonItemSenderBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:item action:@selector(AGCategoryBarButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self associateCopyOfValue_AG:block withKey:&AGCategoryBarButtonItemBlockKey];
    
    return item;
}

#pragma mark -

- (void)addTargetBlock_AG:(AGCategoryBarButtonItemSenderBlock)block
{
    [self setTarget:self];
    [self setAction:@selector(AGCategoryBarButtonItemPressed:)];
    [self associateCopyOfValue_AG:block withKey:&AGCategoryBarButtonItemBlockKey];
}

- (void)removeTargetBlock_AG
{
    [self setTarget:nil];
    [self setAction:NULL];
    [self associateValue_AG:nil withKey:&AGCategoryBarButtonItemBlockKey];
}

#pragma mark -

- (void)AGCategoryBarButtonItemPressed:(UIBarButtonItem *)sender
{
    AGCategoryBarButtonItemSenderBlock block = [self associatedValueForKey_AG:&AGCategoryBarButtonItemBlockKey];
    if (block) block (self);
}

@end