//
//  Cliente.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 08/05/14.
//  Copyright (c) 2014 Espí & Le Barbier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cliente : NSManagedObject

@property (nonatomic, retain) NSString * nif;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *facturasDelCliente;
@end

@interface Cliente (CoreDataGeneratedAccessors)

- (void)addFacturasDelClienteObject:(NSManagedObject *)value;
- (void)removeFacturasDelClienteObject:(NSManagedObject *)value;
- (void)addFacturasDelCliente:(NSSet *)values;
- (void)removeFacturasDelCliente:(NSSet *)values;

@end
