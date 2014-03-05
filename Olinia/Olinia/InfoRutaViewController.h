//
//  InfoRutaViewController.h
//  Olinia
//
//  Created by Christopher Hardy on 3/4/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Ruta.h"

@interface InfoRutaViewController : UIViewController <MKMapViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    Ruta *auxRuta;
}

@property(nonatomic) Ruta *rutaMostrar;
@property (nonatomic, strong) IBOutlet MKMapView *mapView; 
@property (nonatomic, assign) IBOutlet UILabel *labelPrecio;
@property (nonatomic, assign) IBOutlet UILabel *labelOrigen;
@property (nonatomic, assign) IBOutlet UILabel *labelDestino;
@property (nonatomic) IBOutlet UIImageView *imagenBus;
@property (nonatomic, strong) IBOutlet UIPickerView *wheelParadas;

@end
