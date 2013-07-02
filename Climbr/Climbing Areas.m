//
//  Climbing Areas.m
//  TheCrag
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "Climbing Areas.h"
#import "SearchCell.h"
#import "JIClimbing Sections.h"

@interface Climbing_Areas ()

@end

@implementation Climbing_Areas

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
    // Do any additional setup after loading the view from its nib.
    
    self.menuTableView.dataSource = self;
    
    self.areas = [[NSMutableArray alloc] init];
    
    self.title = @"Climbing Areas";
    
    self.URL = [NSString stringWithFormat:@"%@/%@", self.parentURL, self.name];
    
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    [self.f observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            [self.areas addObject:child.name];
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

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.areas.count;
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
    
    cell.nameLabel.text = [self.areas objectAtIndex:indexPath.row];
    //NSLog(@"%@", [self.areas objectAtIndex:indexPath.row]);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JIClimbing_Sections *uiView = [[JIClimbing_Sections alloc] initWithNibName:@"Climbing Sections" bundle:nil];
    uiView.parentURL = self.URL;
    uiView.name = [self.areas objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:uiView animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}



@end
