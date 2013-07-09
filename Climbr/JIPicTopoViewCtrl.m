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
    self.navigationItem.rightBarButtonItem = topo;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTopo:(id)sender {
    JITopoView *uiView = [[JITopoView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.view addSubview:uiView];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}
@end
