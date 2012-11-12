//
//  UIControl+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
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

#import "UIControl+AGCategory.h"
#import "NSObject+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(UIControl_AGCategory);
#endif

static char AGCategoryControlEventTouchDownBlockKey;
static char AGCategoryControlEventTouchDownRepeatBlockKey;
static char AGCategoryControlEventTouchDragInsideBlockKey;
static char AGCategoryControlEventTouchDragOutsideBlockKey;
static char AGCategoryControlEventTouchDragEnterBlockKey;
static char AGCategoryControlEventTouchDragExitBlockKey;
static char AGCategoryControlEventTouchUpInsideBlockKey;
static char AGCategoryControlEventTouchUpOutsideBlockKey;
static char AGCategoryControlEventTouchCancelBlockKey;
static char AGCategoryControlEventValueChangedBlockKey;

@implementation UIControl (AGCategory)

#pragma mark -

- (void)addTargetBlock_AG:(AGCategoryControlSenderBlock)block forControlEvents:(UIControlEvents)controlEvents
{    
    if (UIControlEventTouchDown & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDownBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
        
    if (UIControlEventTouchDownRepeat & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDownRepeatBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    }
        
    if (UIControlEventTouchDragInside & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDragInsideBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
        
    if (UIControlEventTouchDragOutside & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDragOutsideBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    }
        
    if (UIControlEventTouchDragEnter & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDragEnterBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
    }
        
    if (UIControlEventTouchDragExit & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchDragExitBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    }
    
    if (UIControlEventTouchUpInside & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchUpInsideBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (UIControlEventTouchUpOutside & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchUpOutsideBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    }
    
    if (UIControlEventTouchCancel & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventTouchCancelBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    }
        
    if (UIControlEventValueChanged & controlEvents)
    {
        [self associateCopyOfValue_AG:block withKey:&AGCategoryControlEventValueChangedBlockKey];
        [self addTarget:self action:@selector(AGCategoryControlEventValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)removeTargetBlockForControlEvents_AG:(UIControlEvents)controlEvents
{
    if (UIControlEventTouchDown & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDownBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
    
    if (UIControlEventTouchDownRepeat & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDownRepeatBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    }
    
    if (UIControlEventTouchDragInside & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDragInsideBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
    
    if (UIControlEventTouchDragOutside & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDragOutsideBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    }
    
    if (UIControlEventTouchDragEnter & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDragEnterBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
    }
    
    if (UIControlEventTouchDragExit & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchDragExitBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    }
    
    if (UIControlEventTouchUpInside & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchUpInsideBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (UIControlEventTouchUpOutside & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchUpOutsideBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    }
    
    if (UIControlEventTouchCancel & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventTouchCancelBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    }
    
    if (UIControlEventValueChanged & controlEvents)
    {
        [self associateValue_AG:nil withKey:&AGCategoryControlEventValueChangedBlockKey];
        [self removeTarget:self action:@selector(AGCategoryControlEventValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark -

- (void)AGCategoryControlEventTouchDown:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDownBlockKey];
    if (block) block (self);
}

- (void)AGCategoryControlEventTouchDownRepeat:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDownRepeatBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchDragInside:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDragInsideBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchDragOutside:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDragOutsideBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchDragEnter:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDragEnterBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchDragExit:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchDragExitBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchUpInside:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchUpInsideBlockKey];
    if (block) block (self);
}

- (void)AGCategoryControlEventTouchUpOutside:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchUpOutsideBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventTouchCancel:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventTouchCancelBlockKey];
    if (block) block (self); 
}

- (void)AGCategoryControlEventValueChanged:(UIButton *)sender
{
    AGCategoryControlSenderBlock block = [self associatedValueForKey_AG:&AGCategoryControlEventValueChangedBlockKey];
    if (block) block (self); 
}

@end