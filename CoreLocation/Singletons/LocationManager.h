//
//  LocationManager.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "AGSynthesizeSingleton.h"

@interface LocationManager : NSObject <CLLocationManagerDelegate>
{
    
}

#pragma mark - Properties

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *latestLocation;

#pragma mark - Start/Stop Updating Location

+ (void)startUpdatingLocationWithAccuracy:(CLLocationAccuracy)accuracy;
+ (void)startUpdatingLocation;
+ (void)stopUpdatingLocation;

#pragma mark - Location Accuracy

+ (void)setDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy;

#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_INTERFACE(LocationManager, sharedManager);

@end