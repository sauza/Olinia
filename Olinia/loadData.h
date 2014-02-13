//
//  loadData.h
//  Olinia
//
//  Created by Christopher Hardy on 2/12/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadData : NSObject  <NSXMLParserDelegate>

@property(nonatomic,copy) NSMutableArray *arrayDatos;
@property(nonatomic) int bandera;

-(void)cargaInicial;

@end
