//
//  InfoRutaViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 3/4/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "InfoRutaViewController.h"
#import "SWRevealViewController.h"
#import "AddressAnnotation.h"
#import "TableViewControllerRutas.h"

@interface InfoRutaViewController ()

@end

@implementation InfoRutaViewController
@synthesize mapView=_mapView;

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
    
    
    
   	// Do any additional setup after loading the view.
    
    //insercion de puntos para ruta seleccionada
    CLLocationCoordinate2D ctrpoint;
    Ruta *auxRuta=[TableViewControllerRutas getRutaMostrar];
    NSMutableArray *puntos= auxRuta.puntos;
    for (int i=0; i<[puntos count]; i++) {
        ctrpoint.latitude = [[puntos objectAtIndex:i]latitud];
        ctrpoint.longitude =[[puntos objectAtIndex:i]longitud];
        AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init];
        addAnnotation.coordinate=ctrpoint;
        [self.mapView addAnnotation:addAnnotation];
    }
    //centrado de mapa en ruta
    int i=([puntos count]/2)-2;
    CLLocation *ubicacionMedia=[[CLLocation alloc] initWithLatitude:[[puntos objectAtIndex:i]latitud] longitude:[[puntos objectAtIndex:i]longitud]];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(ubicacionMedia.coordinate, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
