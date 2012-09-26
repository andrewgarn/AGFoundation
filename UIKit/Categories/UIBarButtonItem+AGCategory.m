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

static char UIBarButtonItemAGCategoryBlockKey;

@implementation UIBarButtonItem (AGCategory)

- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(UIBarButtonItemSenderBlock)block
{
    self = [self initWithBarButtonSystemItem:systemItem target:self action:@selector(AGCategoryBarButtonItemPressed:)];
    [self associateCopyOfValue:block withKey:&UIBarButtonItemAGCategoryBlockKey];
    return self;
}

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block
{
    self = [self initWithImage:image style:style target:self action:@selector(AGCategoryBarButtonItemPressed:)];
	[self associateCopyOfValue:block withKey:&UIBarButtonItemAGCategoryBlockKey];
	return self;
}

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block;
{
    self = [self initWithTitle:title style:style target:self action:@selector(AGCategoryBarButtonItemPressed:)];
	[self associateCopyOfValue:block withKey:&UIBarButtonItemAGCategoryBlockKey];
	return self;
}

+ (UIBarButtonItem *)customButtonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage block:(UIBarButtonItemSenderBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(AGCategoryBarButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self associateCopyOfValue:block withKey:&UIBarButtonItemAGCategoryBlockKey];
    return item;
}

#pragma mark -

- (void)AGCategoryBarButtonItemPressed:(UIBarButtonItem *)sender
{
    UIBarButtonItemSenderBlock block = [self associatedValueForKey:&UIBarButtonItemAGCategoryBlockKey];
    if (block) block (self);
}

@end