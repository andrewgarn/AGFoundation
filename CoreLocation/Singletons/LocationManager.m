//
//  LocationManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
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

#import "LocationManager.h"

@implementation LocationManager
@synthesize locationManager = _locationManager;
@synthesize latestLocation = _latestLocation;

#pragma mark - Object Lifecycle

- (id)init 
{
    if ((self = [super init]))
    {
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        [_locationManager setDelegate:self];
    }
    return self;
}

#pragma mark - Start/Stop Updating Location

+ (void)startUpdatingLocationWithAccuracy:(CLLocationAccuracy)accuracy
{
    [LocationManager setDesiredAccuracy:accuracy];
    [LocationManager startUpdatingLocation];
}

+ (void)startUpdatingLocation
{
    CLLocationManager *locationManager = [[LocationManager sharedManager] locationManager];
    [locationManager startUpdatingLocation];
}

+ (void)stopUpdatingLocation
{
    CLLocationManager *locationManager = [[LocationManager sharedManager] locationManager];
    [locationManager stopUpdatingLocation];
}

#pragma mark - Distance

+ (double)distanceTo:(CLLocation *)location
{
    CLLocation *latestLocation = [[LocationManager sharedManager] latestLocation];
    if (latestLocation)
    {
        return [latestLocation distanceFromLocation:location];
    }
    return (double)NSIntegerMax;
}

+ (double)distanceTo:(NSNumber *)latitude longitude:(NSNumber *)longitude
{
    CLLocation *latestLocation = [[LocationManager sharedManager] latestLocation];
    if (latestLocation)
    {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
        return [latestLocation distanceFromLocation:location];
    }
    return (double)NSIntegerMax;
}

#pragma mark - Desired Accuracy

+ (void)setDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy
{
    CLLocationManager *locationManager = [[LocationManager sharedManager] locationManager];
    [locationManager setDesiredAccuracy:desiredAccuracy];
}

#pragma mark - CLLocationManagerDelegate (Location Events)

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    _latestLocation = newLocation;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    _latestLocation = nil;
}

#pragma mark - CLLocationManagerDelegate (Heading Events)

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return NO;
}

#pragma mark - CLLocationManagerDelegate (Region Events)

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    
}

#pragma mark - CLLocationManagerDelegate (Authorization Changes)

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    // TODO: Handle
}

#pragma mark - Singleton
SYNTHESIZE_SINGLETON_FOR_IMPLEMENTATION(LocationManager, sharedManager);

@end