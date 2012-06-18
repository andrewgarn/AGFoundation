//
//  LocationManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

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