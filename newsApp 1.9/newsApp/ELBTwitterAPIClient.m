//
//  ELBTwitterAPIClient.m
//  
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "ELBTwitterAPIClient.h"

@implementation ELBTwitterAPIClient

+ (STTwitterAPIWrapper *)twitterAPIApplicationOnlyWithConsumerKey
{
    return [super twitterAPIApplicationOnlyWithConsumerKey:@"xxxxx"
                                            consumerSecret:@"yyyyyy"];// el alumno tiene que solicitar los códigos
}
@end
