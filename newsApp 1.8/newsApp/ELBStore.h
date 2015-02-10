//
//  ELBStore.h
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/01/13.
//  Copyright (c) 2013 Miguel Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString *const kExceptionRaise;
extern NSString *const kExceptionFormat;
extern NSString *const kErrorCrearObjectFormat;
extern NSString *const kErrorSaveObjectFormat;
extern NSString *const kErrorFetchObjectFormat;
extern NSString *const kErrorSaveObjectFormat;
extern NSString *const kErrorSaveContextObjectFormat;



@interface ELBStore : NSObject
   ;
@property (nonatomic,strong) NSManagedObjectContext *context;
@property (nonatomic,strong) NSManagedObjectModel *model;

+ (ELBStore *)defaultStore;

- (BOOL)grabaCambios;

@end
