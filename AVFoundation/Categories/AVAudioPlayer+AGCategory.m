//
//  AVAudioPlayer+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 15/06/2012.
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

#import "AVAudioPlayer+AGCategory.h"
#import <objc/runtime.h>

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(AVAudioPlayer_AGCategory);
#endif

static char AGCategoryAudioPlayerFadingKey;
static char AGCategoryAudioPlayerFadeOriginalVolumeKey;
static char AGCategoryAudioPlayerFadeTargetVolumeKey;
static char AGCategoryAudioPlayerFadeVolumeDeltaKey;
static char AGCategoryAudioPlayerFadeCompletionBlockKey;
static const NSTimeInterval AGCategoryAudioPlayerFadeInterval = 0.05f;

@implementation AVAudioPlayer (AGCategory)

#pragma mark -

- (void)playWithFadeIn_AG
{
    [self playWithFadeInDuration_AG:self.volume];
}

- (void)playWithFadeInDuration_AG:(NSTimeInterval)duration
{
    [self playWithFadeInDuration_AG:duration completion:nil];
}

- (void)playWithFadeInDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock
{
    if ([self isPlaying] == NO) {
        self.volume = 0.0f;
        [self setFadeOriginalVolume_AG:self.volume];
        [self fadeToVolume_AG:[self fadeOriginalVolume_AG] duration:duration completion:completionBlock];
    }
}

#pragma mark -

- (void)pauseWithFadeOut_AG
{
    [self pauseWithFadeOutDuration_AG:self.volume];
}

- (void)pauseWithFadeOutDuration_AG:(NSTimeInterval)duration
{
    [self pauseWithFadeOutDuration_AG:duration completion:nil];
}

- (void)pauseWithFadeOutDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock
{
    if ([self isPlaying]) {
        if ([self isFading_AG] == NO) [self setFadeOriginalVolume_AG:self.volume];
        
        __block CGFloat originalVolume = [self fadeOriginalVolume_AG];
        [self fadeToVolume_AG:0.0f duration:duration completion:^{
            [self pause];
            self.volume = originalVolume;
            if (completionBlock) completionBlock();
        }];
    }
}

#pragma mark -

- (void)stopWithFadeOut_AG
{
    [self stopWithFadeOutDuration_AG:self.volume];
}

- (void)stopWithFadeOutDuration_AG:(NSTimeInterval)duration
{
    [self stopWithFadeOutDuration_AG:duration completion:nil];
}

- (void)stopWithFadeOutDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock
{
    if ([self isPlaying]) {
        if ([self isFading_AG] == NO) [self setFadeOriginalVolume_AG:self.volume];
        
        __block CGFloat originalVolume = [self fadeOriginalVolume_AG];
        [self fadeToVolume_AG:0.0f duration:duration completion:^{
            [self stop];
            self.volume = originalVolume;
            if (completionBlock) completionBlock();
        }];
    }
}

#pragma mark -

- (void)fadeToVolume_AG:(float)targetVolume duration:(NSTimeInterval)duration
{
    [self fadeToVolume_AG:targetVolume duration:duration completion:nil];
}

- (void)fadeToVolume_AG:(float)targetVolume duration:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock
{
    if (duration <= 0) {
        self.volume = targetVolume;
        [self setFading_AG:NO];
        return;
    }
    
    [self setFading_AG:YES];
    [self setFadeTargetVolume_AG:targetVolume];
    [self setFadeVolumeDelta_AG:((targetVolume - self.volume) / (duration / AGCategoryAudioPlayerFadeInterval))];
    [self setFadeCompletionBlock_AG:completionBlock];

    [self play];
    [self fadeFunction_AG];
}

#pragma mark -

- (void)fadeFunction_AG
{
    if ([self isFading_AG] == NO) return;
    
    CGFloat volumeChangeRemaining = [self fadeTargetVolume_AG] - self.volume;
    CGFloat changePerStep = [self fadeVolumeDelta_AG];

    if (fabs(volumeChangeRemaining) > fabs(changePerStep)) {
        self.volume += changePerStep;
        [self performSelector:@selector(fadeFunction_AG) withObject:nil afterDelay:AGCategoryAudioPlayerFadeInterval];
    } else {
        self.volume = [self fadeTargetVolume_AG];
        [self setFading_AG:NO];
        
        AGCategoryAudioPlayerBlock completionBlock = [self fadeCompletionBlock_AG];
        if (completionBlock) completionBlock();
        [self setFadeCompletionBlock_AG:nil];
    }
}

#pragma mark - Associated Properties

- (BOOL)isFading_AG
{
    return [(NSNumber *)objc_getAssociatedObject(self, &AGCategoryAudioPlayerFadingKey) boolValue];
}

- (void)setFading_AG:(BOOL)isFading
{
    objc_setAssociatedObject(self, &AGCategoryAudioPlayerFadingKey, [NSNumber numberWithBool:isFading], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)fadeOriginalVolume_AG
{
    return [(NSNumber *)objc_getAssociatedObject(self, &AGCategoryAudioPlayerFadeOriginalVolumeKey) doubleValue];
}

- (void)setFadeOriginalVolume_AG:(CGFloat)originalVolume
{
    objc_setAssociatedObject(self, &AGCategoryAudioPlayerFadeOriginalVolumeKey, [NSNumber numberWithDouble:originalVolume], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)fadeTargetVolume_AG
{
    return [(NSNumber *)objc_getAssociatedObject(self, &AGCategoryAudioPlayerFadeTargetVolumeKey) doubleValue];
}

- (void)setFadeTargetVolume_AG:(CGFloat)targetVolume
{
    objc_setAssociatedObject(self, &AGCategoryAudioPlayerFadeTargetVolumeKey, [NSNumber numberWithDouble:targetVolume], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)fadeVolumeDelta_AG
{
    return [(NSNumber *)objc_getAssociatedObject(self, &AGCategoryAudioPlayerFadeVolumeDeltaKey) doubleValue];
}

- (void)setFadeVolumeDelta_AG:(CGFloat)volumeDelta
{
    objc_setAssociatedObject(self, &AGCategoryAudioPlayerFadeVolumeDeltaKey, [NSNumber numberWithDouble:volumeDelta], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AGCategoryAudioPlayerBlock)fadeCompletionBlock_AG
{
    return (AGCategoryAudioPlayerBlock)objc_getAssociatedObject(self, &AGCategoryAudioPlayerFadeCompletionBlockKey);
}

- (void)setFadeCompletionBlock_AG:(AGCategoryAudioPlayerBlock)block
{
    objc_setAssociatedObject(self, &AGCategoryAudioPlayerFadeCompletionBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end