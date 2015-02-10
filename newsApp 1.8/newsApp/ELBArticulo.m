//
//  ELBArticulo.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 19/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBArticulo.h"
#import "ELBStore.h"

@implementation ELBArticulo

@dynamic fecha;
@dynamic nombre;
@dynamic texto;

static NSString* const kNombreEntidadArticulo=@"ELBArticulo";

+ (NSString *)entityName
{
    return kNombreEntidadArticulo;

}

+(NSArray *)articulos
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSManagedObjectModel *model= [[ELBStore defaultStore] model];
    NSEntityDescription *e = [[model entitiesByName] objectForKey:[ELBArticulo entityName]];
    
    [request setEntity:e];
    
    
    
    NSSortDescriptor *sd = [NSSortDescriptor
                            sortDescriptorWithKey:@"nombre"
                            ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sd]];
    
    NSManagedObjectContext *context= [[ELBStore defaultStore] context];

    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result) {
        [NSException raise:@"Fetch failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    return result;
}
@end
