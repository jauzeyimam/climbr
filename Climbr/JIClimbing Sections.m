//
//  Climbing Sections.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIClimbing Sections.h"
#import "JIClimbingSectionCell.h"
#import "JIRoutes.h"

@interface JIClimbing_Sections ()

@end

@implementation JIClimbing_Sections

@synthesize menuTableView;

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
    
    self.menuTableView.dataSource = self;
    
    self.sections = [[NSMutableArray alloc] init];
    
    self.value = [[NSMutableArray alloc] init];
    
    self.title = @"Climbing Sections";
    
    self.URL = [NSString stringWithFormat:@"%@/%@/%@", self.parentURL, self.name, self.title];
    
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.f observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            [self.sections addObject:child.name];
            NSArray *dictValues = [NSArray arrayWithObjects:[(NSDictionary*) child.value objectForKey:@"Number"], [(NSDictionary*) child.value objectForKey:@"Type"], [(NSDictionary*) child.value objectForKey:@"Description"], nil];
            [self.value addObject:dictValues];
            //NSLog(@"%@", child.name);
            //NSLog(@"%@", [dictValues objectAtIndex:2]);
            [self.menuTableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    JIClimbingSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"JIClimbingSectionCell" owner:self options:nil];
        
        for (id currentObject in objects) {
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (JIClimbingSectionCell *) currentObject;
                break;
            }
        }
    }
    
    cell.routeName.text = [self.sections objectAtIndex:indexPath.row];
    cell.rockType.text = [NSString stringWithFormat:@"Rock Type: %@", [[self.value objectAtIndex:indexPath.row] objectAtIndex:1]];
    cell.number.text = [NSString stringWithFormat:@"%@ Routes", [[self.value objectAtIndex:indexPath.row] objectAtIndex:0]];
    cell.description = [[self.value objectAtIndex:indexPath.row] objectAtIndex:2];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JIRoutes *uiView = [[JIRoutes alloc] initWithNibName:@"JIRoutes" bundle:nil];
    uiView.parentURL = self.URL;
    uiView.name = [self.sections objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:uiView animated:YES];

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}





@end
