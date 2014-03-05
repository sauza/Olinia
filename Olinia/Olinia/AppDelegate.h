//
//  AppDelegate.h
//  Olinia
//
//  Created by Christopher Hardy on 2/7/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ruta.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL firstTime;
@property (nonatomic, copy) NSMutableArray *rutaCompArray;

+(NSMutableArray *) getRuta;


@end
