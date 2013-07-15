//
//  JITopoListView.h
//  Climbr
//
//  Created by Imam, Jauzey on 7/14/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopoNumberDelegate <NSObject>
@required
- (void) topoShow: (NSString*) number;
@end

@interface JITopoListView : UIViewController

@end
