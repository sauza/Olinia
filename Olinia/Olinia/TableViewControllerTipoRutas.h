//
//  TableViewControllerTipoRutas.h
//  Olinia
//
//  Created by Christopher Hardy on 2/23/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewControllerTipoRutas : UITableViewController{
}
@property (nonatomic, strong) NSArray *menuItems;
//@property (nonatomic, copy) AppDelegate *appDelegate;
//@property (nonatomic, assign) NSMutableArray *arrayDatos;

//+(Ruta *) getRutaMostrar;
+(int) getTipoRutaMostrar;
@end
