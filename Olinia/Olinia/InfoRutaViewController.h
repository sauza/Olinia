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

@interface InfoRutaViewController : UIViewController <MKMapViewDelegate>

@property(nonatomic, copy) Ruta *rutaMostrar;

@end
