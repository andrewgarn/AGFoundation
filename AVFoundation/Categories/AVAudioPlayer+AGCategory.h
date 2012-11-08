//
//  AVAudioPlayer+AGCategory.h
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

#import <AVFoundation/AVFoundation.h>
typedef void (^AGCategoryAudioPlayerBlock)(void);

/** A collection of category extensions for `AVAudioPlayer` */
@interface AVAudioPlayer (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Controlling Playback with Fade
 ---------------------------------------------------------------------------------------
*/

/** Plays a sound asynchronously while fading in audio volume with a default duration. */
- (void)playWithFadeIn_AG;

/** Plays a sound asynchronously while fading in audio volume with the specified duration.
 @param duration The duration of the audio fade in.
*/
- (void)playWithFadeInDuration_AG:(NSTimeInterval)duration;

/** Plays a sound asynchronously while fading in audio volume with the specified duration and completion block.
 @param duration The duration of the audio fade in.
 @param completionBlock A block object called when the audio fade in is complete.
*/
- (void)playWithFadeInDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock;

/**-------------------------------------------------------------------------------------
 @name Pausing Playback with Fade
 ---------------------------------------------------------------------------------------
*/

/** Pauses playback while fading out audio volume with a default duration. */
- (void)pauseWithFadeOut_AG;

/** Pauses playback while fading out audio volume with the specified duration.
 @param duration The duration of the audio fade out.
*/
- (void)pauseWithFadeOutDuration_AG:(NSTimeInterval)duration;

/** Pauses playback while fading out audio volume with the specified duration and completion block.
 @param duration The duration of the audio fade out.
 @param completionBlock A block object called when the audio fade out is complete.
*/
- (void)pauseWithFadeOutDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock;

/**-------------------------------------------------------------------------------------
 @name Stopping Playback with Fade
 ---------------------------------------------------------------------------------------
*/

/** Stops playback and undoes the setup needed for playback while fading out audio volume with a default duration. */
- (void)stopWithFadeOut_AG;

/** Stops playback and undoes the setup needed for playback while fading out audio volume with the specified duration.
 @param duration The duration of the audio fade out.
*/
- (void)stopWithFadeOutDuration_AG:(NSTimeInterval)duration;

/** Stops playback and undoes the setup needed for playback while fading out audio volume with the specified duration and completion block.
 @param duration The duration of the audio fade out.
 @param completionBlock A block object called when the audio fade out is complete.
*/
- (void)stopWithFadeOutDuration_AG:(NSTimeInterval)duration completion:(AGCategoryAudioPlayerBlock)completionBlock;

@end