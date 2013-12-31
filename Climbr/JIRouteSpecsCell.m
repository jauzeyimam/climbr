//
//  JIRouteSpecsCell.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/29/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIRouteSpecsCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation JIRouteSpecsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
        
        self.cellImg = [[UIImageView alloc] initWithFrame:self.bounds];
        self.cellImg.contentMode = UIViewContentModeScaleAspectFill;
        self.cellImg.clipsToBounds = YES;
        
        [self.contentView addSubview:self.cellImg];
    }
    return self;
}

- (void) setItemDetail: (UIImage*) img
{
    self.cellImg.image = [UIImage imageNamed:@"AngelOfPoets.png"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
