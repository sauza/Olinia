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
#import "TableViewControllerListaRutas.h"

@interface InfoRutaViewController ()

@end

@implementation InfoRutaViewController
@synthesize mapView=_mapView;
@synthesize labelPrecio=_labelPrecio;
@synthesize labelOrigen=_labelOrigen;
@synthesize labelDestino=_labelDestino;
@synthesize imagenBus=_imagenBus;
//@synthesize wheelParadas=_wheelParadas;

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
    
    
    
    self.title = @"Información Ruta";
    
    auxRuta=[TableViewControllerListaRutas getRutaMostrar];
    
    //self.navigationController.presentedViewController.title=auxRuta.nombreRuta;
    
    //insercion de puntos para ruta seleccionada
    CLLocationCoordinate2D ctrpoint;
    //auxRuta=[TableViewControllerTipoRutas getRutaMostrar];
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
    
    //Mostrado de informacion
    self.imagenBus.image=auxRuta.imagenCromatica;
    self.labelPrecio.text=auxRuta.precio;
    self.labelDestino.text=auxRuta.destino;
    self.labelOrigen.text=auxRuta.origen;
    
    //self.wheelParadas.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//wheelpicker??

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CLLocation *ubicacionMedia=[[CLLocation alloc] initWithLatitude:[[auxRuta.puntos objectAtIndex:row]latitud] longitude:[[auxRuta.puntos objectAtIndex:row]longitud]];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(ubicacionMedia.coordinate, 400, 400);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [auxRuta.puntos count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [[auxRuta.puntos objectAtIndex:row] nombre];
}

@end
