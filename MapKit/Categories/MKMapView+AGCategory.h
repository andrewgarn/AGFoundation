//
//  MKMapView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 26/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

/* Sourced from: http://troybrant.net/blog/2010/01/set-the-zoom-level-of-an-mkmapview/ */

#import <MapKit/MapKit.h>

/** A collection of category extensions for `MKMapView` */
@interface MKMapView (AGCategory)

/** A convienence method to modify the center and zoom level of the map without specifying a `MKCoordinateRegion`.
 @param centerCoordinate The map coordinate at the center of the map view.
 @param zoomLevel The zoom level to set the map to.
 @param animated Specify YES to animate modifying the map view, or NO to modify it immediately.
*/ 
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate zoomLevel:(NSUInteger)zoomLevel animated:(BOOL)animated;

@end