//
//  UserDefaultsManager.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

/* Modified from original source code from MKiCloudSync by Mugunth Kumar */
/* Original license available at: https://github.com/MugunthKumar/MKiCloudSync */

#import <Foundation/Foundation.h>
#import "AGSynthesizeSingleton.h"

extern NSString * const AGUserDefaultsDidChangeNotification;

@interface UserDefaultsManager : NSObject
{
    
}

#pragma mark - Properties

@property (nonatomic, strong) NSUserDefaults *userDefaults;

#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_INTERFACE(UserDefaultsManager, sharedManager);

@end