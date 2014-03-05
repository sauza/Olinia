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
static Ruta *rutaMostrar = nil;


- (void) viewDidLoad{
    
    rutaMostrar=[[Ruta alloc]init];
    
    self.arrayDatos=[AppDelegate getRuta];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"reaching accessoryButtonTappedForRowWithIndexPath:");
    rutaMostrar=[self.arrayDatos objectAtIndex:indexPath.row];
}

// 5 Marzo No necesario por implementacion de accessoryButtonTappedForRowWithIndexPath
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // numero de secciones en tabla
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //numero de filas
    return [self.arrayDatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Llenado de celdas con info de ArrayRutas
    Celda *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaListaRutas"];
    if (cell == nil) {
        cell = [[Celda alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celdaListaRutas"];
    }
    cell.nombre.text = [[self.arrayDatos objectAtIndex:indexPath.row]nombreRuta];
    cell.imagenBus.image=[[self.arrayDatos objectAtIndex:indexPath.row]imagenCromatica];
    return cell;
}

// 5_Marzo no es necesaria por el momento por presentacion mediante
// accessoryButtonTappedForRowWithIndexPath

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"reached prepareforSegue");
//    InfoRutaViewController* destinationController = (InfoRutaViewController *)segue.destinationViewController;
//    destinationController.rutaMostrar=rutaMostrar;
//    if ([[segue identifier] isEqualToString:@"mostrarInfoRuta"]) {
//        InfoRutaViewController* destinationController = (InfoRutaViewController *)segue.destinationViewController;
//       destinationController.rutaMostrar=rutaMostrar;
//       [self presentViewController:destinationController animated:NO completion:nil];
//    }
//}

+(Ruta*) getRutaMostrar
{
    @synchronized(self)
    {
        if(rutaMostrar == nil)
        {
            rutaMostrar = [[self alloc] init];
            rutaMostrar = [[Ruta alloc] init];
        }
        return rutaMostrar;
    }
}



@end
