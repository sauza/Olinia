//
//  Ruta.h
//  Olinia
//
//  Created by Christopher Hardy on 2/12/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Punto.h"

@interface Ruta : NSObject
@property (nonatomic, assign)int ID_Ruta;
@property(nonatomic, copy) NSString *origen;
@property(nonatomic, copy) NSString *destino;
@property (nonatomic, copy) NSString *urlImage_Cromatica;
@property (nonatomic, copy) UIImage *imagenCromatica;
@property (nonatomic, copy) NSString *urlImage_Paradas;
@property (nonatomic, copy) UIImage *imagenParadas;
@property(nonatomic, copy) NSMutableArray* puntos;

@end
