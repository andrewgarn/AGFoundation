//
//  AGSoundEffect.m
//  AGFoundation
//
//  Created by Andrew Garn on 11/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGSoundEffect.h"

@implementation AGSoundEffect

#pragma mark - Object Lifecycle

- (AGSoundEffect *)initWithSoundNamed:(NSString *)filename
{
    if ((self = [super init]))
    {
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (fileURL != nil)
        {
            SystemSoundID systemSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &systemSoundID);
            
            if (error == kAudioServicesNoError)
                _systemSoundID = systemSoundID;
        }
    }
    return self;
}

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(_systemSoundID);
}

#pragma mark -

- (void)play
{
    AudioServicesPlaySystemSound(_systemSoundID);
}

@end