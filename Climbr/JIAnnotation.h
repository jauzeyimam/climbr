//
//  Annotation.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/28/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface JIAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id) initWithTitle:(NSString *) t coordinate:(CLLocationCoordinate2D) c;

@end
