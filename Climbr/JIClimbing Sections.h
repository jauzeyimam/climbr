//
//  Climbing Sections.h
//  TheCrag
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface JIClimbing_Sections : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *menuTableView;
}

@property (weak, nonatomic) NSString *parentURL;
@property (weak, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *sections;
@property (nonatomic, strong) Firebase *f;
@property (retain, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) NSMutableArray *value;
@property (strong, nonatomic) NSString *URL;


@end
