//
//  Punto.h
//  Olinia
//
//  Created by Christopher Hardy on 2/12/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Punto : NSObject

@property(nonatomic, assign)bool sentido;
@property(nonatomic, assign)int ID_Punto;
@property(nonatomic, assign) double latitud;
@property(nonatomic, assign) double longitud;
@property(nonatomic, copy) NSString *nombre;

@end
