//
//  AGSoundEffect.h
//  AGFoundation
//
//  Created by Andrew Garn on 11/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

/** An `NSObject` subclass to aid in playing a short sound effect */ 
@interface AGSoundEffect : NSObject
{
    SystemSoundID _systemSoundID;
}

/** 
 Returns a `AGSoundEffect` object initialized with the supplied sound file.
 @param filename The filename of the sound resource, including extension.
 @return A `AGSoundEffect` object initialized with the specified sound.
*/
- (AGSoundEffect *)initWithSoundNamed:(NSString *)filename;

/** 
 Plays the sound effect 
*/
- (void)play;

@end