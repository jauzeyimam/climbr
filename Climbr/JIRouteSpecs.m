//
//  RouteSpecs.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/28/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIRouteSpecs.h"
#import "JIRouteSpecsCell.h"

@interface JIRouteSpecs ()

@end

@implementation JIRouteSpecs


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
    self.name.text = self.nameText;
    self.grade.text = self.gradeText;
    self.type.text = self.typeText;
    self.location.text = self.locText;
    self.description.text = self.descText;

    self.URL = [NSString stringWithFormat:@"%@/%@", self.parentURL, self.routeName];
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.location setUserInteractionEnabled:NO];
    [self.description setUserInteractionEnabled:NO];
    
    
    
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
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JIRouteSpecsCell *Cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"
                                              forIndexPath:indexPath];
    UIImage *img = [UIImage imageNamed:@"AngelOfPoets.png"];
    [Cell setItemDetail:img];
    
    return Cell;

}

-(void) collectionView:(UICollectionView*) collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
