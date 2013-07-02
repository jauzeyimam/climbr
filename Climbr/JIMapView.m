//
//  MapView.m
//  TheCrag
//
//  Created by Imam, Jauzey on 6/24/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIMapView.h"
#import "JIAnnotation.h"
#import "JIClimbing Sections.h"


@interface JIMapView ()

@end

@implementation JIMapView

@synthesize mapView, locationManager, geocoder, placemark;

NSString *address;
int zoom;
NSString *annotationName;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView = [[MKMapView alloc] initWithFrame: CGRectMake(0, 0, 320, 568)];
    self.mapView.delegate = self;
    [self.mapView setMapType: MKMapTypeHybrid];
    [self.view addSubview: mapView];
    
    zoom = 2;
        
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
     
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];

    NSLog(@"%d", zoom);

    self.mapView.showsUserLocation = YES;
    
    
    UIBarButtonItem *zoomIn = [[UIBarButtonItem alloc]
                               initWithTitle:@"+" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomIn)
                               ];
    
    UIBarButtonItem *zoomOut = [[UIBarButtonItem alloc]
                               initWithTitle:@"-" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomOut)
                               ];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:zoomIn, zoomOut, nil];
    
    [self populateAnnotations];
    
}

- (IBAction)zoomIn
{
    zoom = zoom + 1;
    [self.mapView setCenterCoordinate: mapView.centerCoordinate zoomLevel:zoom animated:YES];
    NSLog(@"%d", zoom);

}

- (IBAction)zoomOut
{
    if (zoom > 1) zoom = zoom - 1;
    [self.mapView setCenterCoordinate: mapView.centerCoordinate zoomLevel:zoom animated:YES];
    NSLog(@"%d", zoom);
}

- (void) populateAnnotations
{
    self.URL = @"https://climbon.firebaseio.com";
    
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.f observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            CLLocationCoordinate2D annotationCoord;
            
            annotationCoord.latitude = [[child.value objectForKey:@"Latitude"] floatValue];
            annotationCoord.longitude = [[child.value objectForKey:@"Longitude"] floatValue];
            
            JIAnnotation *anno = [[JIAnnotation alloc] initWithTitle:child.name coordinate:annotationCoord];
            [self.mapView addAnnotation:anno];
        }
    }];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    //CLLocation *currentLocation = newLocation;
    
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            address = [NSString stringWithFormat:@"%@ %@, %@, %@ %@",
                       placemark.subThoroughfare, placemark.thoroughfare,
                       placemark.locality,
                       placemark.administrativeArea, placemark.postalCode];
            NSLog(@"address: %@", address);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
    [locationManager stopUpdatingLocation];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[JIAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton setTitle:annotation.title forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
        annotationName = annotation.title;
        annotationView.rightCalloutAccessoryView = rightButton;

        return annotationView;
    }
    
    return nil; 
}

- (IBAction) showDetails: (id) sender;
{
    JIClimbing_Sections *uiView = [[JIClimbing_Sections alloc] initWithNibName:@"JIClimbing Sections" bundle:nil];
    uiView.parentURL = self.URL;
    uiView.name = annotationName;
    
    [self.navigationController pushViewController:uiView animated:YES];
}

@end
