//
//  TableViewControllerRutas.m
//  Olinia
//
//  Created by Christopher Hardy on 2/23/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "TableViewControllerRutas.h"

@implementation TableViewControllerRutas
@synthesize appDelegate=_appDelegate;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    NSLog(@"touch on row %d", selectedRow);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    //return [dataArray count];
    return [_appDelegate.rutas count];
}



@end
