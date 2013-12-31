//
//  JITopoListView.m
//  Climbr
//
//  Created by Imam, Jauzey on 7/14/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import "JITopoListView.h"
#import "JITopoListCell.h"

@interface JITopoListView ()

@end

@implementation JITopoListView

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
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    JITopoListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"JITopoListCell" owner:self options:nil];
        
        for (id currentObject in objects) {
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (JITopoListCell *) currentObject;
                break;
            }
        }
    }
    
    cell.number.text = @"%@", indexPath.row;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[self.navigationController pushViewController:uiView animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

@end
