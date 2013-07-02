//
//  ClimbingSectionCell.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIClimbingSectionCell.h"

@implementation JIClimbingSectionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showDescription:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:self.description delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}
@end
