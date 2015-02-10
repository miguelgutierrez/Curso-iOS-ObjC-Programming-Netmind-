//
//  ELBPost.h
//  
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_POSTS  20

@interface ELBPost : NSObject

@property (readonly) NSString *iden;
@property (readonly) NSString *texto;
@property (readonly) NSDate *creado;

- (id)initWithAttributes:(NSDictionary *)attributes;
- (BOOL) isEqual:(id)object;

+ (void)ultimosPost:(void (^)(NSArray *post,NSError *error))completionBlock total:(int)total;



@end
