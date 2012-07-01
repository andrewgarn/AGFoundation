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

static char kUIControlEventTouchDownBlockKey;
static char kUIControlEventTouchDownRepeatBlockKey;
static char kUIControlEventTouchDragInsideBlockKey;
static char kUIControlEventTouchDragOutsideBlockKey;
static char kUIControlEventTouchDragEnterBlockKey;
static char kUIControlEventTouchDragExitBlockKey;
static char kUIControlEventTouchUpInsideBlockKey;
static char kUIControlEventTouchUpOutsideBlockKey;
static char kUIControlEventTouchCancelBlockKey;
static char kUIControlEventValueChangedBlockKey;

@implementation UIControl (AGCategory)

#pragma mark -

- (void)addTargetBlock:(UIControlSenderBlock)block forControlEvents:(UIControlEvents)controlEvents
{    
    if (UIControlEventTouchDown & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDownBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
        
    if (UIControlEventTouchDownRepeat & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDownRepeatBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    }
        
    if (UIControlEventTouchDragInside & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDragInsideBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
        
    if (UIControlEventTouchDragOutside & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDragOutsideBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    }
        
    if (UIControlEventTouchDragEnter & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDragEnterBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
    }
        
    if (UIControlEventTouchDragExit & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchDragExitBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    }
    
    if (UIControlEventTouchUpInside & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchUpInsideBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (UIControlEventTouchUpOutside & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchUpOutsideBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    }
    
    if (UIControlEventTouchCancel & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventTouchCancelBlockKey];
        [self addTarget:self action:@selector(_controlEventTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    }
        
    if (UIControlEventValueChanged & controlEvents)
    {
        [self associateCopyOfValue:block withKey:&kUIControlEventValueChangedBlockKey];
        [self addTarget:self action:@selector(_controlEventValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)removeTargetBlockForControlEvents:(UIControlEvents)controlEvents
{
    if (UIControlEventTouchDown & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDownBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
    
    if (UIControlEventTouchDownRepeat & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDownRepeatBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
    }
    
    if (UIControlEventTouchDragInside & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDragInsideBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
    
    if (UIControlEventTouchDragOutside & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDragOutsideBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
    }
    
    if (UIControlEventTouchDragEnter & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDragEnterBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
    }
    
    if (UIControlEventTouchDragExit & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchDragExitBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    }
    
    if (UIControlEventTouchUpInside & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchUpInsideBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (UIControlEventTouchUpOutside & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchUpOutsideBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    }
    
    if (UIControlEventTouchCancel & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventTouchCancelBlockKey];
        [self removeTarget:self action:@selector(_controlEventTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    }
    
    if (UIControlEventValueChanged & controlEvents)
    {
        [self associateCopyOfValue:nil withKey:&kUIControlEventValueChangedBlockKey];
        [self removeTarget:self action:@selector(_controlEventValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark -

- (void)_controlEventTouchDown:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDownBlockKey];
    if (block) block (self);
}

- (void)_controlEventTouchDownRepeat:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDownRepeatBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchDragInside:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDragInsideBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchDragOutside:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDragOutsideBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchDragEnter:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDragEnterBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchDragExit:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchDragExitBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchUpInside:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchUpInsideBlockKey];
    if (block) block (self);
}

- (void)_controlEventTouchUpOutside:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchUpOutsideBlockKey];
    if (block) block (self); 
}

- (void)_controlEventTouchCancel:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventTouchCancelBlockKey];
    if (block) block (self); 
}

- (void)_controlEventValueChanged:(UIButton *)sender
{
    UIControlSenderBlock block = [self associatedValueForKey:&kUIControlEventValueChangedBlockKey];
    if (block) block (self); 
}

@end