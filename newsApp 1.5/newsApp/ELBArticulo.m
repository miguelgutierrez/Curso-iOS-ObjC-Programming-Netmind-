//
//  ELBArticulo.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBArticulo.h"


@implementation ELBArticulo
/*
@dynamic nombre;
@dynamic fecha;
@dynamic texto;
*/
@synthesize nombre=_nombre;
@synthesize fecha=_fecha;
@synthesize texto=_texto;

- (id)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    return self;
}

@end
