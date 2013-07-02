//
//  MapView.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/24/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKMapView+ZoomLevel.h"
#import <Firebase/Firebase.h>
#import <MapKit/MKAnnotation.h>
#import "JIAnnotation.h"

@interface JIMapView : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    MKMapView *mapView;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) Firebase *f;
@property (strong, nonatomic) NSString *URL;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLPlacemark *placemark;


- (IBAction)zoomIn;
- (IBAction)zoomOut;

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;

@end
