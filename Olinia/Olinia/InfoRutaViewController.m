//
//  InfoRutaViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 3/4/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "InfoRutaViewController.h"

@interface InfoRutaViewController ()

@end

@implementation InfoRutaViewController

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
    
    /*NSMutableArray *tempPuntos=[[NSMutableArray alloc]init];
     CLLocationCoordinate2D ctrpoint;
     for (int i=0;i< [self.mRutas count]; i++) {
     
     tempPuntos=[[self.mRutas objectAtIndex:i]puntos];
     for (int j=0; j<[tempPuntos count]; j++) {
     ctrpoint.latitude = [[tempPuntos objectAtIndex:j]latitud];
     ctrpoint.longitude =[[tempPuntos objectAtIndex:j]longitud];
     
     AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init];
     addAnnotation.coordinate=ctrpoint;
     [mapView addAnnotation:addAnnotation];
     }
     }*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
