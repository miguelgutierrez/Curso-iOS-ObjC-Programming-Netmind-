//
//  Factura.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 08/05/14.
//  Copyright (c) 2014 Espí & Le Barbier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente;

@interface Factura : NSManagedObject

@property (nonatomic, retain) NSNumber * codigo;
@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) Cliente *clienteDeLaFactura;

@end
