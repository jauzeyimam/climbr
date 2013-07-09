//
//  JITopoView.m
//  Climbr
//
//  Created by Imam, Jauzey on 7/2/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JITopoView.h"

@implementation JITopoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        myPath=[[UIBezierPath alloc]init];
        myPath.lineCapStyle=kCGLineCapRound;
        myPath.miterLimit=0;
        myPath.lineWidth=10;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    [[UIColor blackColor] setStroke];
    [myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    
    if (myPath.empty)
    {
        [myPath moveToPoint:[mytouch locationInView:self]];
        [myPath addLineToPoint:[mytouch locationInView:self]];
        CGPoint pnt = [mytouch locationInView:self];
        NSLog(@"%@", NSStringFromCGPoint(pnt));
    }else
        [myPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
    */
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*  
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
     */
}


@end
