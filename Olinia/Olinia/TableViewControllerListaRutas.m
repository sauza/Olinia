//
//  TableViewControllerListaRutas.m
//  Olinia
//
//  Created by Christopher Hardy on 3/14/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "TableViewControllerListaRutas.h"
#import "TableViewControllerTipoRutas.h"
#import "AppDelegate.h"
#import "Celda.h"

@interface TableViewControllerListaRutas ()

@end

@implementation TableViewControllerListaRutas
@synthesize appDelegate=_appDelegate;
@synthesize arrayRuta=_arrayRuta;
static Ruta *rutaMostrar = nil;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //int clase = [TableViewControllerTipoRutas getTipoRutaMostrar];
    
    if([TableViewControllerTipoRutas getTipoRutaMostrar]==0){
        self.arrayRuta=[AppDelegate getRuta:0];
    }
    else if([TableViewControllerTipoRutas getTipoRutaMostrar]==1){
        self.arrayRuta=[AppDelegate getRuta:1];
    }
    else if([TableViewControllerTipoRutas getTipoRutaMostrar]==2){
        self.arrayRuta=[AppDelegate getRuta:2];
    }
    
    self.title=@"Rutas Disponibles";
    
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.arrayRuta count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Celda *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaListaRutas"];
    if (cell == nil) {
        cell = [[Celda alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celdaListaRutas"];
    }
    
    
    cell.nombre.lineBreakMode = NSLineBreakByWordWrapping;
    cell.nombre.numberOfLines = 0;
    
    //cell.nombre.adjustsFontSizeToFitWidth=NO;
    //cell.nombre.numberOfLines=0;
    NSString *textoCelda=[[[self.arrayRuta objectAtIndex:indexPath.row]nombreRuta] stringByReplacingOccurrencesOfString:@" " withString:@"\r "];
    
    cell.nombre.text = textoCelda;
    
    
    //cell.nombre.text = [[self.arrayRuta objectAtIndex:indexPath.row]nombreRuta];
    cell.imagenBus.image=[[self.arrayRuta objectAtIndex:indexPath.row]imagenCromatica];
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"reaching accessoryButtonTappedForRowWithIndexPath:");
    rutaMostrar=[self.arrayRuta objectAtIndex:indexPath.row];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

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
