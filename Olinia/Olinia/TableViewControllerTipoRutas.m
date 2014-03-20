//
//  TableViewControllerTipoRutas.m
//  Olinia
//
//  Created by Christopher Hardy on 2/23/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

//#import "TableViewControllerTipoRutas.h"
#import "SWRevealViewController.h"
#import "Celda.h"
#import "TableViewControllerTipoRutas.h"


@implementation TableViewControllerTipoRutas
@synthesize menuItems=_menuItems;
//@synthesize appDelegate=_appDelegate;
//@synthesize arrayDatos=_arrayDatos;
//static NSMutableArray *rutaMostrar = nil;
static int tipoRuta;


- (void) viewDidLoad{
    
    tipoRuta=0;
    
    self.title=@"Tipos";
    
    _menuItems = @[@"TuzoBus", @"Microbus", @"Combi", @"Taxi"];
    
    //rutaMostrar=[[NSMutableArray alloc]init];
    
    //self.arrayDatos=[AppDelegate getRuta];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"reaching accessoryButtonTappedForRowWithIndexPath:");
    tipoRuta=indexPath.row;
    //rutaMostrar=[self.arrayDatos objectAtIndex:indexPath.row];
    
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
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"celdaTipoRuta";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    /*if (cell == nil) {
        cell = [[Celda alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celdaListaTipoRutas"];
    }*/
    cell.textLabel.text=[self.menuItems objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}





// 5_Marzo no es necesaria por el momento por presentacion mediante
// accessoryButtonTappedForRowWithIndexPath

//    InfoRutaViewController* destinationController = (InfoRutaViewController *)segue.destinationViewController;
//    destinationController.rutaMostrar=rutaMostrar;
//    if ([[segue identifier] isEqualToString:@"mostrarInfoRuta"]) {
//        InfoRutaViewController* destinationController = (InfoRutaViewController *)segue.destinationViewController;
//       destinationController.rutaMostrar=rutaMostrar;
//       [self presentViewController:destinationController animated:NO completion:nil];
//    }
//

/*+(Ruta*) getRutaMostrar
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
}*/


+(int) getTipoRutaMostrar{
    @synchronized(self)
    {
        return tipoRuta;
    }
}


@end
