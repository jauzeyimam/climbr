//
//  Routes.m
//  Climbr
//
//  Created by Imam, Jauzey on 6/22/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JIRoutes.h"
#import "JIRouteCell.h"
#import "JIRouteSpecs.h"

@interface JIRoutes ()

@end

@implementation JIRoutes

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
    
    self.routes = [[NSMutableArray alloc] init];
    
    self.value = [[NSMutableArray alloc] init];
    
    self.title = @"Routes";
    
    self.URL = [NSString stringWithFormat:@"%@/%@/%@", self.parentURL, self.name, @"Routes"];
    self.f = [[Firebase alloc] initWithUrl:self.URL];
    
    //NSSortDescriptor *sortDescriptor;
    //sortDescriptor = [[NSSortDescriptor alloc] initWithKey: ascending:<#(BOOL)#>];
    
    
    [self.f observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            [self.routes addObject: child.name ];
            NSDictionary *dictValues = @{
                                         @"Grade": [child.value objectForKey:@"Grade"],
                                         @"Sequence": [child.value objectForKey:@"Sequence"],
                                         @"Description": [child.value objectForKey:@"Description"],
                                         @"Location": [child.value objectForKey:@"Location"],
                                         @"Type": [child.value objectForKey:@"Type"]};
            
            [self.value addObject:dictValues];
            //NSLog(@"%@", [dictValues objectAtIndex:0]);
            //NSLog(@"%@", [dictValues objectAtIndex:1]);

            
            
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
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    JIRouteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"JIRouteCell" owner:self options:nil];
        
        for (id currentObject in objects) {
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (JIRouteCell *) currentObject;
                break;
            }
        }
    }
    cell.name.text = [NSString  stringWithFormat:@"%@", [self.routes objectAtIndex:indexPath.row]];
    cell.grade.text = [NSString stringWithFormat:@"%@", [[self.value objectAtIndex:indexPath.row] objectForKey:@"Grade"]];
    cell.sequence.text = [NSString stringWithFormat:@"%@", [[self.value objectAtIndex:indexPath.row] objectForKey:@"Sequence"]];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JIRouteSpecs *uiView = [[JIRouteSpecs alloc] initWithNibName:@"JIRouteSpecs" bundle:nil];
    uiView.parentURL = self.URL;
    uiView.nameText = [self.routes objectAtIndex:indexPath.row];
    uiView.gradeText = [[self.value objectAtIndex:indexPath.row] objectForKey:@"Grade"];
    uiView.locText = [[self.value objectAtIndex:indexPath.row] objectForKey:@"Location"];
    uiView.typeText = [[self.value objectAtIndex:indexPath.row] objectForKey:@"Type"];
    uiView.descText = [[self.value objectAtIndex:indexPath.row] objectForKey:@"Description"];

    
    NSLog(@"%@", [self.routes objectAtIndex:indexPath.row]);
    
    
    [self.navigationController pushViewController:uiView animated:YES];

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
