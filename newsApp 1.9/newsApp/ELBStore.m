//
//  ELBStore.m
//  newsApp
//
//  Created by Miguel Gutiérrez Moreno on 20/01/13.
//  Copyright (c) 2013 Miguel Gutiérrez. All rights reserved.
//

#import "ELBStore.h"

NSString *const kExceptionRaise=@"Open failed";
NSString *const kExceptionFormat=@"Reason: %@";
NSString *const kErrorCrearObjectFormat=@"Error crear managed object context: %@";
NSString *const kErrorSaveObjectFormat=@"Error crear managed object context: %@";
NSString *const kErrorFetchObjectFormat =@"Failed to fetch with error = %@";
NSString *const kErrorSaveContextObjectFormat =@"Failed to save the context with error = %@";

@interface ELBStore()

+ (NSString *)myNewsAppArchivePath;

@end

@implementation ELBStore
@synthesize context=_context;
@synthesize model=_model;

+ (ELBStore *)defaultStore
{
    static ELBStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

- (id)init
{
    self = [super init];
    if(self) {
        // Read in Homepwner.xcdatamodeld
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];

        
        NSPersistentStoreCoordinator *psc =
        [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        
        // Where does the SQLite file go?
        NSURL *storeURL = [NSURL fileURLWithPath:[ELBStore myNewsAppArchivePath]];
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise:kExceptionRaise
                        format: kExceptionFormat, [error localizedDescription]];
        }
        
        // Create the managed object context
        _context = [[NSManagedObjectContext alloc] init];
        [_context setPersistentStoreCoordinator:psc];
        
        // The managed object context can manage undo, but we don't need it
        [_context setUndoManager:nil];
        
    }
    return self;
}

- (BOOL)grabaCambios
{
    NSError *err = nil;
    BOOL successful = [_context save:&err];
    if (!successful) {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    return successful;
}


#pragma mark - estáticas
+ (NSString *)myNewsAppArchivePath
{

    NSArray *documentDirectories =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];    
    return [documentDirectory stringByAppendingPathComponent:@"myNewsApp.sqlite"];

}

@end
