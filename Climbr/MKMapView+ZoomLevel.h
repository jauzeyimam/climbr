//
//  MKMapView.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/26/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;


@end
