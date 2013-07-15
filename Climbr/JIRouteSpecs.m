//
//  RouteSpecs.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/28/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIRouteSpecs.h"
#import "JIRouteSpecsCell.h"
#import "JIPicTopoViewCtrl.h"

@interface JIRouteSpecs ()

@end

@implementation JIRouteSpecs
{
    NSMutableArray *imageArray;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageArray = [[NSMutableArray alloc] init];
    
    self.name.text = self.nameText;
    self.grade.text = self.gradeText;
    self.type.text = self.typeText;
    self.location.text = self.locText;
    self.description.text = self.descText;

    self.URL = [NSString stringWithFormat:@"%@/%@", self.parentURL, self.routeName];
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.location setUserInteractionEnabled:NO];
    [self.description setUserInteractionEnabled:NO];

    self.topos = [[NSMutableArray alloc] init];
    
    UIImage *img = [UIImage imageNamed:@"AngelOfPoets.png"];
    
    [imageArray addObject:img];

    
    
    //NSSortDescriptor *sortDescriptor;
    //sortDescriptor = [[NSSortDescriptor alloc] initWithKey: ascending:<#(BOOL)#>];
    
    self.images.backgroundColor = [UIColor colorWithWhite:0.00f alpha:0.0f];
    
    [self.images registerClass:[JIRouteSpecsCell class]
            forCellWithReuseIdentifier:@"PhotoCell"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPhoto:(id)sender {

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JIRouteSpecsCell *Cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"
                                              forIndexPath:indexPath];
    
    [Cell setItemDetail:[imageArray objectAtIndex:indexPath.row]];
    
    return Cell;

}

-(void) collectionView:(UICollectionView*) collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JIPicTopoViewCtrl *uiView = [[JIPicTopoViewCtrl alloc] initWithNibName:@"JIPicTopoViewCtrl" bundle:nil];
    
    uiView.img = [imageArray objectAtIndex:indexPath.row];
    uiView.index = indexPath.row;
    uiView.delegate = self;
    if (self.topos.count != 0)
        uiView.path = [[self.topos objectAtIndex:0] valueForKey:@"0"];
    [self.navigationController pushViewController:uiView animated:YES];
}

-(void) addTopo: (NSData*) topo withIndex:(int) index;
{
    if ([self.topos count] == 0)
    {
        [self.topos insertObject:@{@"0": topo} atIndex:index];
    }
    else
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:[self.topos objectAtIndex:index]];
        NSString *count = [NSString stringWithFormat:@"%d",[[self.topos objectAtIndex:index] count]];
        [dict setObject:topo forKey:count];
        [self.topos insertObject:dict atIndex:index];
        NSLog(@"%@", dict);
    }
}


@end
