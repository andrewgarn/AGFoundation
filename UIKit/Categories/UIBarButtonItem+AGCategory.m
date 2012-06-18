//
//  UIBarButtonItem+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 29/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIBarButtonItem+AGCategory.h"
#import "NSObject+AGCategory.h"

static char kUIBarButtonItemBlockKey;

@implementation UIBarButtonItem (AGCategory)

+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem)systemItem block:(UIBarButtonItemSenderBlock)block
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:self action:@selector(_barButtonPressed:)];
    [item associateCopyOfValue:block withKey:&kUIBarButtonItemBlockKey];
    return item;
}

+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:style target:self action:@selector(_barButtonPressed:)];
    [item associateCopyOfValue:block withKey:&kUIBarButtonItemBlockKey];
    return item;
}

+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(UIBarButtonItemSenderBlock)block
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:style target:self action:@selector(_barButtonPressed:)];
    [item associateCopyOfValue:block withKey:&kUIBarButtonItemBlockKey];
    return item;
}

+ (UIBarButtonItem *)customButtonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage block:(UIBarButtonItemSenderBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(_barButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self associateCopyOfValue:block withKey:&kUIBarButtonItemBlockKey];
    
    return item;
}

#pragma mark -

- (void)_barButtonPressed:(UIBarButtonItem *)sender
{
    UIBarButtonItemSenderBlock block = [self associatedValueForKey:&kUIBarButtonItemBlockKey];
    if (block) block (self);
}

@end