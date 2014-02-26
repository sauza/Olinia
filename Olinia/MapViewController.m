//
//  MapViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 2/7/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import "loadData.h"

@interface MapViewController ()

@end

@implementation MapViewController

//@synthesize mapView;
//@synthesize appDelegate=_appDelegate;
@synthesize mRutas=_mRutas;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    mapView = [[MKMapView alloc]
               initWithFrame:CGRectMake(0,
                                        0,
                                        self.view.bounds.size.width,
                                        self.view.bounds.size.height)
               ];
    mapView.showsUserLocation = YES;
    mapView.mapType = MKMapTypeStandard;
    //mapView.delegate = self;
    [self.view addSubview:mapView];
    
    self.mRutas=[NSMutableArray array];
    
    [self cargaInicial];
    
    

    
    
    
    
//    
//    locationManager = [[CLLocationManager alloc] init];
//    
//   
//    mapView.showsUserLocation=YES;
//    [mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
//    
//    MKCoordinateRegion coordinateRegion;
//    
//    [mapView setRegion:coordinateRegion animated:YES];
//    
//    
//    coordinateRegion.center = mapView.centerCoordinate;
//    coordinateRegion.span.latitudeDelta = 20;
//    coordinateRegion.span.longitudeDelta = 20;
//        
    
//    
//    
//    // Add MKMapView in your View
//    
//    mapView=[[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    mapView.delegate=self;
//    [self.view addSubview:mapView];
//    
//    
//    
//    
//    // Create an instance of CLLocationManager
//    
//    locationManager=[[CLLocationManager alloc] init];
//    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
//    locationManager.delegate=self;
//    [locationManager startUpdatingLocation];
//    
//    // Create an instance of CLLocation
//    
//    location=[locationManager location];
//    
//    // Set Center Coordinates of MapView
//    
//    mapView.centerCoordinate=CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
//    
//    // Set Annotation to show current Location
//    
//    MKPointAnnotation *annotaionPoint=[[MKPointAnnotation alloc] init];
//    annotaionPoint.coordinate=mapView.centerCoordinate;
//    annotaionPoint.title=@"New Delhi";
//    annotaionPoint.subtitle=@"Capital";
//    [mapView addAnnotation:annotaionPoint];

   
 
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Change button color
        _sidebarButton.tintColor = [UIColor colorWithRed:11 green:97 blue:255 alpha:0];
        
        // Set the side bar button action. When it's tapped, it'll show up the sidebar.
        _sidebarButton.target = self.revealViewController;
        _sidebarButton.action = @selector(revealToggle:);
        
        // Set the gesture
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapVista viewForAnnotation:(id <MKAnnotation>)annotation {
    if (annotation == mapView.userLocation) return nil;
    else {
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapVista
                                                               dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
        if (!pinView) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
        
    }
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta = 0.005f;
        span.longitudeDelta = 0.005f;
        CLLocationCoordinate2D location;
        location.latitude = aUserLocation.coordinate.latitude;
        location.longitude = aUserLocation.coordinate.longitude;
        region.span = span;
        region.center = location;
        [aMapView setRegion:region animated:YES];
        cont++;
}

-(void)cargaInicial{
    
    loadData *loader;
    loader=[[loadData alloc]init];
    [loader cargaInicial];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [_appDelegate.rutas addObject:loader.rutaActual];
    
   
    
    self.mRutas=_appDelegate.rutas;
}



@end