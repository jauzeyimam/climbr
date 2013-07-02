//
//  ClimbingSectionCell.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JIClimbingSectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *routeName;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *rockType;
@property (weak, nonatomic) NSString* description;

- (IBAction)showDescription:(id)sender;

@end
