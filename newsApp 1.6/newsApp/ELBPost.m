//
//  ELBPost.m
//
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBPost.h"
#import "ELBTwitterAPIClient.h"

@interface ELBPost()

+ (NSString *) parametrosBusqueda;

@end

@implementation ELBPost

@synthesize iden=_iden;
@synthesize texto=_texto;
@synthesize creado=_creado;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _iden = [attributes valueForKeyPath:@"id_str"];
    _texto = [attributes valueForKeyPath:@"text"];
    NSString *auxDateString=[attributes valueForKeyPath:@"created_at"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_EN"];
    [df setLocale:locale];
    
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];// Wed, Jun 25 10:33:57 +0000 2013
    
    _creado = [df dateFromString: auxDateString];
    
    return self;
}

- (BOOL) isEqual:(id)object
{
    return [_iden isEqualToString: ((ELBPost*)object).iden];
}
+ (void)ultimosPost:(void (^)(NSArray *post,NSError *error))completionBlock total:(int)total
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    STTwitterAPIWrapper *twitter = [ELBTwitterAPIClient twitterAPIApplicationOnlyWithConsumerKey];
    
    
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
        
        //NSLog(@"Access granted for %@", username);
        
        [twitter getSearchTweetsWithQuery:[ELBPost parametrosBusqueda] optionalGeocode:nil optionalLang:nil optionalLocale:nil optionalResultType:nil optionalCount:[NSString stringWithFormat:@"%i",total] optionalUntil:nil optionalSinceID:nil optionalMaxID:nil includeEntities:nil optionalCallback:nil successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[statuses count]];
            for (NSDictionary *attributes in statuses) {
                ELBPost *post = [[ELBPost alloc] initWithAttributes:attributes];
                [mutablePosts addObject:post];
            }
            
            if (completionBlock) {
                completionBlock([NSArray arrayWithArray:mutablePosts], nil);
            }
            
        } errorBlock:^(NSError *error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            NSLog(@"-- error %@", error);
            if (completionBlock)
                completionBlock([NSArray array], error);
            
        }];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"-- error %@", error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (completionBlock)
            completionBlock([NSArray array], error);
    }];
}
+ (NSString *)parametrosBusqueda
{
    return @"iOS";
    
}
@end
