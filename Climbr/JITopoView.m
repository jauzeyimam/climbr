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
        self.myPath=[[UIBezierPath alloc]init];
        self.myPath.lineCapStyle=kCGLineCapRound;
        self.myPath.miterLimit=0;
        self.myPath.lineWidth=10;
                
        /*UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.frame = CGRectMake(0, 462, self.frame.size.width, 44);
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil]];
        [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil]];
        [toolbar setItems:items animated:NO];
        [self addSubview:toolbar];*/
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] setStroke];
    [self.myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    //[self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    
    if (self.myPath.empty)
    {
        [self.myPath moveToPoint:[mytouch locationInView:self]];
        [self.myPath addLineToPoint:[mytouch locationInView:self]];
        CGPoint pnt = [mytouch locationInView:self];
        NSLog(@"%@", NSStringFromCGPoint(pnt));
    }else
        [self.myPath addLineToPoint:[mytouch locationInView:self]];
    NSLog(@"%@", self.myPath);
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
