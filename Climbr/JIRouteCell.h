//
//  RouteCell.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JIRouteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sequence;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *grade;

@end
