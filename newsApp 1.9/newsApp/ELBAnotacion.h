//
//  ELBAnotacion.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface ELBAnotacion : NSObject <MKAnnotation>

- (id) initConCoordenada:(CLLocationCoordinate2D) coordenada;

@end
