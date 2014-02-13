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
    NSMutableString *stringBuffer;
    Ruta *actualRuta;
    Punto *actualPunto;
    int numPunto;
}

@end


@implementation loadData

@synthesize arrayDatos=_arrayDatos;


-(void)cargaInicial{
    numPunto=1;
    self.arrayDatos = [[NSMutableArray alloc]init];
    [self parseXML];
    
    
}

- (void)parseXML{
    NSString *path;
    path = @"www.aqtiva.mx/olinia/prueba.xml";
    NSURL *xmlURL = [NSURL URLWithString:path];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    _arrayDatos = [[NSMutableArray alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"ruta"]) {
        
        actualRuta = [[Ruta alloc] init];
    } else if ([elementName isEqualToString:@"idRuta"] || [elementName isEqualToString:@"origen"] || [elementName isEqualToString:@"destino"] || [elementName isEqualToString:@"punto"] || [elementName isEqualToString:@"idpunto"]  || [elementName isEqualToString:@"latitud"] || [elementName isEqualToString:@"longitud"]){
        stringBuffer = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [stringBuffer appendString:string];
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
        if ([elementName isEqualToString:@"ruta"]) {
            
            [_arrayDatos addObject:actualRuta];
        }
        else if ([elementName isEqualToString:@"idRuta"]) {
            
            actualRuta.ID_Ruta = [[stringBuffer description] intValue];
            
        }
        else if ([elementName isEqualToString:@"origen"]) {
            
            actualRuta.origen = [stringBuffer description];
        }
        else if ([elementName isEqualToString:@"destino"]) {
            actualRuta.destino = [stringBuffer description];
        }
        else if ([elementName isEqualToString:@"punto"]) {
            
        }
        else if ([elementName isEqualToString:@"idpunto"]) {
            actualPunto.ID_Punto = [[stringBuffer description] intValue];
        }
        else if ([elementName isEqualToString:@"latitud"]) {
            
            actualPunto.latitud = [[stringBuffer description] floatValue];
        }
        else if ([elementName isEqualToString:@"longitud"]) {
            
            actualPunto.longitud = [[stringBuffer description] floatValue];
        }
        else if ([elementName isEqualToString:@"nombre"]) {
            
            actualPunto.nombre = [stringBuffer description];
            actualRuta.puntos[numPunto]=actualPunto;
            numPunto++;
        }
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Error while processing XML file (Error code %d)",[parseError code]];
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


@end
