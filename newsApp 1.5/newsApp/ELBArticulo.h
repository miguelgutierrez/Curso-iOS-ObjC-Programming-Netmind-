//
//  ELBArticulo.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ELBArticulo : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSString * texto;

- (id)init;

@end
