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
#import "AddressAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;
//@synthesize mapView;
//@synthesize appDelegate=_appDelegate;
@synthesize mRutas=_mRutas;
@synthesize ubicacionABuscar=_ubicacionABuscar;
AddressAnnotation *annot;
CGPoint touchPoint;
CLLocationCoordinate2D touchMapCoordinate;
bool primera = TRUE;

- (void)viewDidLoad
{
    //NSLog(@"viewdidload");
    [super viewDidLoad];
    self.title=@"Buscar";
    //Inicialización de variables
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    //self.mRutas=[NSMutableArray array];
    
    
    self.mapView.delegate = self;
    //[self.ubicacionABuscar setDelegate:self];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    // [locationManager startMonitoringSignificantLocationChanges];
    
    //Agregar la boton y gesture para sidebar controller
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //[locationManager stopUpdatingLocation];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.70; //usuario debe de presionar por 0.70s
    lpgr.allowableMovement=1;
    [self.mapView addGestureRecognizer:lpgr];
    [locationManager startUpdatingLocation];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
}

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
 }*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locationManager stopUpdatingLocation];
    NSLog(@"didUpdateToLocation: %@", newLocation);
    ubicacionActual=newLocation;
    
    if (ubicacionActual != nil) {
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(ubicacionActual.coordinate, 800, 800);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        //longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}



- (IBAction)buscarUbicacion:(id)sender forEvent:(UIEvent *)event {
    [self.ubicacionABuscar resignFirstResponder];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (annot==nil) {
        if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
            return;
        
        touchPoint = [gestureRecognizer locationInView:self.mapView];
        touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        annot = [[AddressAnnotation alloc] init];
        annot.coordinate = touchMapCoordinate;
        [self.mapView addAnnotation:annot];
    }
    else{
        [self.mapView removeAnnotation:annot];
        touchPoint = [gestureRecognizer locationInView:self.mapView];
        touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        annot = [[AddressAnnotation alloc] init];
        annot.coordinate = touchMapCoordinate;
        [self.mapView addAnnotation:annot];
    }
    
    //[annot release];
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *aV;
    
    // Don't pin drop if annotation is user location
    if ([aV.annotation isKindOfClass:[MKUserLocation class]]) {
        //continue;
    }
    
    // Check if current annotation is inside visible map rect, else go to next one
    MKMapPoint point =  MKMapPointForCoordinate(aV.annotation.coordinate);
    if (!MKMapRectContainsPoint(self.mapView.visibleMapRect, point)) {
        //continue;
    }
    
    
    CGRect endFrame = aV.frame;
    
    // AQUIIIII
    aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - self.view.frame.size.height, aV.frame.size.width, aV.frame.size.height);
    
    // Animate drop
    [UIView animateWithDuration:0.5 delay:0.04*[views indexOfObject:aV] options: UIViewAnimationOptionCurveLinear animations:^{
        
        aV.frame = endFrame;
        
        // Animate squash
    }completion:^(BOOL finished){
        if (finished) {
            [UIView animateWithDuration:0.05 animations:^{
                aV.transform = CGAffineTransformMakeScale(1.0, 0.8);
                
            }completion:^(BOOL finished){
                if (finished) {
                    [UIView animateWithDuration:0.1 animations:^{
                        aV.transform = CGAffineTransformIdentity;
                    }];
                }
            }];
        }
    }];
}
//}


@end