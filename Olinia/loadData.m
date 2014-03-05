//
//  loadData.h
//  Olinia
//
//  Created by Christopher Hardy on 2/12/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "loadData.h"
#import "Ruta.h"
#import "Punto.h"


@interface loadData () {
    NSXMLParser *parser;
    NSString *stringBuffer;
    //NSMutableString *stringBuffer;
    NSMutableArray *arrayPuntos;// = [[NSMutableArray alloc] init];
    NSMutableArray *arrayRutasFin;
    //Ruta *actualRuta;
    //Punto *actualPunto;
}


@end


@implementation loadData

@synthesize arrayDatos=_arrayDatos;
//@synthesize arrayPuntos=_arrayPuntos;
@synthesize bandera=_bandera;
@synthesize rutaActual=_rutaActual;
@synthesize actualPunto=_actualPunto;

-(void)cargaInicial{
    self.bandera=1;
    self.arrayDatos = [[NSMutableArray alloc]init];
    arrayPuntos = [[NSMutableArray alloc] init];
    arrayRutasFin= [[NSMutableArray alloc] init];
    self.rutaActual = [[Ruta alloc] init];
    [self parseXML];
    
    
}

- (void)parseXML{
    NSString *path;
    if(self.bandera==1){
        path = @"http://aqtiva.mx/olinia/prueba.xml";
    }
    else if (self.bandera==2){
        path = @"http://users.salleurl.edu/~xsole/ms/artists01.xml";
    }
    else if (_bandera==3){
        path = @"http://users.salleurl.edu/~xsole/ms/works01.xml";
    }
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //_arrayDatos = [[Ruta alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if (_bandera==1){
        if ([elementName isEqualToString:@"rutas"]) {
            
            //actualRuta = [[Ruta alloc] init];
            self.rutaActual.puntos=[[NSMutableArray alloc] init];
            
        } else if ([elementName isEqualToString:@"idRuta"] || [elementName isEqualToString:@"precio"]  || [elementName isEqualToString:@"nombreRuta"] || [elementName isEqualToString:@"origen"] || [elementName isEqualToString:@"destino"] || [elementName isEqualToString:@"imageCromatica"] || [elementName isEqualToString:@"imageParada"] || [elementName isEqualToString:@"punto"] || [elementName isEqualToString:@"sentido"] || [elementName isEqualToString:@"idpunto"] || [elementName isEqualToString:@"latitud"] || [elementName isEqualToString:@"longitud"] || [elementName isEqualToString:@"nombre"]){
            stringBuffer = [[NSMutableString alloc] init];
        }
    }
    
    
    
//    if ([elementName isEqualToString:@"ruta"]) {
//        
//        actualRuta = [[Ruta alloc] init];
//    } else if ([elementName isEqualToString:@"idRuta"] || [elementName isEqualToString:@"origen"] || [elementName isEqualToString:@"destino"] || [elementName isEqualToString:@"punto"] || [elementName isEqualToString:@"idpunto"]  || [elementName isEqualToString:@"latitud"] || [elementName isEqualToString:@"longitud"]){
//        stringBuffer = [[NSMutableString alloc] init];
//    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //stringBuffer=@"";
    stringBuffer=string;
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
        if ([elementName isEqualToString:@"ruta"]) {
            self.arrayDatos = [[NSMutableArray alloc] init];
        }
        else if ([elementName isEqualToString:@"idRuta"]) {
            self.rutaActual.ID_Ruta = [stringBuffer intValue];
        }
        else if ([elementName isEqualToString:@"precio"]) {
            self.rutaActual.precio = stringBuffer;
        }
        else if ([elementName isEqualToString:@"nombreRuta"]) {
            self.rutaActual.nombreRuta = stringBuffer;
        }
        else if ([elementName isEqualToString:@"origen"]) {
            self.rutaActual.origen = stringBuffer;
        }
        else if ([elementName isEqualToString:@"destino"]) {
            self.rutaActual.destino = stringBuffer;
        }
        else if ([elementName isEqualToString:@"imageCromatica"]) {
            self.rutaActual.urlImage_Cromatica = stringBuffer;
        }
        else if ([elementName isEqualToString:@"imageParada"]) {
            self.rutaActual.urlImage_Paradas = stringBuffer;
        }
        else if ([elementName isEqualToString:@"sentido"]) {
            self.actualPunto = [[Punto alloc] init];
            self.actualPunto.sentido = [stringBuffer boolValue];
        }
        else if ([elementName isEqualToString:@"idpunto"]) {
            self.actualPunto.ID_Punto = [stringBuffer intValue];
        }
        else if ([elementName isEqualToString:@"latitud"]) {
            self.actualPunto.latitud = [stringBuffer doubleValue];
        }
        else if ([elementName isEqualToString:@"longitud"]) {
            self.actualPunto.longitud = [stringBuffer doubleValue];
        }
        else if ([elementName isEqualToString:@"nombre"]) {
            self.actualPunto.nombre = stringBuffer;
            [arrayPuntos addObject:self.actualPunto];
        }
        else if ([elementName isEqualToString:@"endof"]){
            self.rutaActual.puntos = arrayPuntos;
            [arrayRutasFin addObject:self.rutaActual];
        }
        else if ([elementName isEqualToString:@"fin"]){
            self.arrayDatos=arrayRutasFin;
        }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Error while processing XML file (Error code %d)",[parseError code]];
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


@end
