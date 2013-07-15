//
//  JIPicTopoView.h
//  Climbr
//
//  Created by Imam, Jauzey on 7/2/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JITopoListView.h"

@protocol TopoDelegate <NSObject>
@required
- (void) addTopo: (NSData*) topo withIndex:(int) index;
@end

@interface JIPicTopoViewCtrl : UIViewController <TopoNumberDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgLabel;
@property (strong, nonatomic) UIImage *img;
@property int index;
@property (nonatomic, assign) id<TopoDelegate> delegate;
@property (strong, nonatomic) NSArray *topos;

@end
