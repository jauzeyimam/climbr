//
//  ViewController.h
//  TheCrag
//
//  Created by Imam, Jauzey on 6/12/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Firebase/Firebase.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView* menuTableView;    
    
}
@property (retain, nonatomic) IBOutlet UITableView *menuTableView;
@property (nonatomic, strong) Firebase *f;
@property (strong, nonatomic) NSMutableArray *states;
@property (strong, nonatomic) NSString *URL;




@end    