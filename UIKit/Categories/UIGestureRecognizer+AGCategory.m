//
//  UIGestureRecognizer+AGCategory.m
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

#import "UIGestureRecognizer+AGCategory.h"
#import "NSObject+AGCategory.h"

static char AGCategoryGestureRecognizerBlockKey;

@implementation UIGestureRecognizer (AGCategory)

#pragma mark -

- (void)addTargetBlock_AG:(UIGestureRecognizerSenderBlock)block
{
    [self associateCopyOfValue_AG:block withKey:&AGCategoryGestureRecognizerBlockKey];
    [self addTarget:self action:@selector(AGCategoryGestureRecognizerRecognized:)];
}

- (void)removeTargetBlock_AG
{
    [self associateCopyOfValue_AG:nil withKey:&AGCategoryGestureRecognizerBlockKey];
    [self removeTarget:self action:@selector(AGCategoryGestureRecognizerRecognized:)]; 
}

#pragma mark -
     
- (void)AGCategoryGestureRecognizerRecognized:(UIBarButtonItem *)sender
{
    UIGestureRecognizerSenderBlock block = [self associatedValueForKey_AG:&AGCategoryGestureRecognizerBlockKey];
    if (block) block (self);
}

@end