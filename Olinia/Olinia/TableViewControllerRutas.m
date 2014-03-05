//
//  TableViewControllerRutas.m
//  Olinia
//
//  Created by Christopher Hardy on 2/23/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "TableViewControllerRutas.h"
#import "SWRevealViewController.h"
#import "Celda.h"
#import "InfoRutaViewController.h"


@implementation TableViewControllerRutas
@synthesize appDelegate=_appDelegate;
@synthesize arrayDatos=_arrayDatos;


- (void) viewDidLoad{
    //_sidebarButton.target = self.revealViewController;
    //_sidebarButton.action = @selector(revealToggle:);
    
    rutaMostrar=[[Ruta alloc]init];
    
    self.arrayDatos=[AppDelegate getRuta];
    
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;

    
    //_sidebarButton=flipButton;
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    NSLog(@"touch on row %d", selectedRow);
    
    rutaMostrar=[self.arrayDatos objectAtIndex:selectedRow];
    
    
    [self performSegueWithIdentifier:@"mostrarInfoRuta" sender:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    //return [dataArray count];
    
    return [self.arrayDatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Celda *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaListaRutas"];
    if (cell == nil) {
        cell = [[Celda alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celdaListaRutas"];
    }
//    NSString *cellText = [[self.arrayDatos objectAtIndex:indexPath.row]origen];
//    NSString *cellText2 = [cellText stringByAppendingString:@" "];
//    NSString *cellText3 = [cellText2 stringByAppendingString:[[self.arrayDatos objectAtIndex:indexPath.row]destino]];
    
    cell.nombre.text = [[self.arrayDatos objectAtIndex:indexPath.row]nombreRuta];
    cell.imagenBus.image=[[self.arrayDatos objectAtIndex:indexPath.row]imagenCromatica];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"mostrarInfoRuta"]) {
        
        InfoRutaViewController *vc = [segue destinationViewController];
        
        vc.rutaMostrar=rutaMostrar;
    }
}



@end
