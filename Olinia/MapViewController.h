//
//  MapViewController.h
//  Olinia
//
//  Created by Christopher Hardy on 2/7/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate>{
    CLLocationManager *locationManager;
    CLLocation *ubicacionActual;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}


@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, copy) AppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray* mRutas;
//@property (nonatomic, strong) IBOutlet UITextField *buscarUbicacion;
- (IBAction)buscarUbicacion:(id)sender forEvent:(UIEvent *)event;
@property (weak, nonatomic) IBOutlet UITextField *ubicacionABuscar;

@end
