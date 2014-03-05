//
//  AddressAnnotation.m
//  Olinia
//
//  Created by Christopher Hardy on 3/3/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate;

- (NSString *)subtitle{
    return nil;
}

- (NSString *)title{
    return nil;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
    coordinate=c;
    return self;
}

@end
