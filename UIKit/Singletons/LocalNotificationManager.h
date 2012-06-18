//
//  LocalNotificationManager.h
//  AGFoundation
//
//  Created by Andrew Garn on 11/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGSynthesizeSingleton.h"

@interface LocalNotificationManager : NSObject

#pragma mark -



#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_INTERFACE(LocalNotificationManager, sharedManager);

@end