//
//  TableViewControllerListaRutas.h
//  Olinia
//
//  Created by Christopher Hardy on 3/14/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewControllerListaRutas : UITableViewController

@property (nonatomic, copy) AppDelegate *appDelegate;
@property (nonatomic, assign) NSMutableArray *arrayRuta;

+(Ruta *) getRutaMostrar;
@end
