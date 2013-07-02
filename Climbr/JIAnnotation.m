//
//  Annotation.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/28/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIAnnotation.h"

@implementation JIAnnotation

@synthesize coordinate, title, subtitle;

- (id) initWithTitle:(NSString *) t coordinate:(CLLocationCoordinate2D) c{
    self = [super init];
    self.title = t;
    self.coordinate = c;
    return self;
}

@end
