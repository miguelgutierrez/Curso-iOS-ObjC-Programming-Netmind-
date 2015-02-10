//
//  ELBAnotacion.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBAnotacion.h"

@interface ELBAnotacion ()

@property (nonatomic) CLLocationCoordinate2D coordenada;

@end

@implementation ELBAnotacion

-(id)initConCoordenada:(CLLocationCoordinate2D)coordenada
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _coordenada=coordenada;
    return self;
}

@synthesize coordenada=_coordenada;

- (CLLocationCoordinate2D)coordinate;
{
    return _coordenada;
}
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordenada=newCoordinate;
}
-(NSString *)title
{
    return @"Mi casa";
}
-(NSString *)subtitle
{
    NSString *texto =[ NSString stringWithFormat:@"Coordenadas: %0.5f,%0.5f",_coordenada.latitude,_coordenada.longitude ];
    return texto;
}
@end
