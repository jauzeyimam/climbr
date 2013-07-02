//
//  Routes.h
//  TheCrag
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface JIRoutes : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *menuTableView;
}

@property (retain, nonatomic) IBOutlet UITableView *menuTableView;
@property (nonatomic, strong) Firebase *f;
@property (strong, nonatomic) NSMutableArray *routes;
@property (weak, nonatomic) NSString *parentURL;
@property (weak, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *value;
@property (strong, nonatomic) NSString *URL;


@end