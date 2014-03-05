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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startMonitoringSignificantLocationChanges];
    
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.mRutas=[NSMutableArray array];
    self.mRutas=[AppDelegate getRuta];
    
     
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
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    ubicacionActual=newLocation;
    
    if (currentLocation != nil) {
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(ubicacionActual.coordinate, 800, 800);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        
        //longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}



@end