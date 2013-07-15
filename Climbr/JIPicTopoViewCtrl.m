//
//  JIPicTopoView.m
//  Climbr
//
//  Created by Imam, Jauzey on 7/2/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIPicTopoViewCtrl.h"
#import "JITopoView.h"

@interface JIPicTopoViewCtrl ()

@end

@implementation JIPicTopoViewCtrl

UIToolbar *toolbar;
JITopoView *uiView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.imgLabel setImage:self.img];
    
    UIBarButtonItem *topo = [[UIBarButtonItem alloc]
                               initWithTitle:@"Topo" style:UIBarButtonItemStyleBordered target:self action:@selector(addTopo:)
                               ];
    
    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 462, self.view.frame.size.width, 44);
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButton)]];
    [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil]];
    [toolbar setItems:items animated:NO];
    
    self.navigationItem.rightBarButtonItem = topo;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTopo:(id)sender {
    uiView = [[JITopoView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    /*UIBezierPath *bezPath = [NSKeyedUnarchiver unarchiveObjectWithData:self.path];
    if (self.path != nil)
        uiView.myPath = bezPath;*/
    [self.view addSubview:uiView];
    [self.view addSubview:toolbar];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void) saveButton
{
    NSData *bezierPath = [NSKeyedArchiver archivedDataWithRootObject:uiView.myPath];
    [self.delegate addTopo:bezierPath withIndex:self.index];
}

- (void) topoShow:(NSString *)number
{
    
}

@end
