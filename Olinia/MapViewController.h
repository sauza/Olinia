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

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
    CLLocation *ubicacionActual;
}


@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, copy) AppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray* mRutas;

@end
