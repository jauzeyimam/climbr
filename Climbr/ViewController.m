//
//  ViewController.m
//  TheCrag
//
//  Created by Imam, Jauzey on 6/12/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "ViewController.h"
#import "SearchCell.h"
#import <Firebase/Firebase.h>
#import "Climbing Areas.h"


@interface ViewController ()

@end

@implementation ViewController {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@synthesize menuTableView;


NSString *address;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    self.menuTableView.dataSource = self;
    
    self.states = [[NSMutableArray alloc] init];
    
    self.title = @"State";
    
    self.URL = @"https://climbon.firebaseio.com/State";
    
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.f observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            [self.states addObject:child.name];
            //NSLog(@"%@", child.name);
            [self.menuTableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.states.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil];
        
        for (id currentObject in objects) {
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (SearchCell *) currentObject;
                break;
            }
        }
    }
    
    cell.nameLabel.text = [self.states objectAtIndex:indexPath.row];
    //NSLog(@"%@", [self.states objectAtIndex:indexPath.row]);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Climbing_Areas *uiView = [[Climbing_Areas alloc] initWithNibName:@"Climbing Areas" bundle:nil];
    uiView.parentURL = self.URL;
    uiView.name = [self.states objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:uiView animated:YES];

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}




@end
