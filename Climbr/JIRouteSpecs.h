//
//  RouteSpecs.h
//  Climbr
//
//  Created by Imam, Jauzey on 6/28/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>


@interface JIRouteSpecs : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    
}

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UITextView *location;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UICollectionView *images;

@property (weak, nonatomic) NSString *nameText;
@property (weak, nonatomic) NSString *gradeText;
@property (weak, nonatomic) NSString *typeText;
@property (weak, nonatomic) NSString *locText;
@property (weak, nonatomic) NSString *descText;

@property (nonatomic, strong) Firebase *f;
@property (strong, nonatomic) NSString *URL;
@property (weak, nonatomic) NSString *parentURL;
@property (strong, nonatomic) NSString *routeName;



- (IBAction)addPhoto:(id)sender;

@end
