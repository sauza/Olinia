//
//  Punto.h
//  Olinia
//
//  Created by Christopher Hardy on 2/12/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Punto : NSObject

@property(nonatomic, assign)int ID_Punto;
@property(nonatomic, assign) float latitud;
@property(nonatomic, assign) float longitud;
@property(nonatomic, copy) NSString *nombre;

@end
