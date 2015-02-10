//
//  ELBTwitterAPIClient.h
//  
//
//  Created by Miguel Gutiérrez Moreno on 13/06/13.
//  Copyright (c) 2013 Espí & Le Barbier. All rights reserved.
//

#import "STTwitterAPIWrapper.h"

@interface ELBTwitterAPIClient : STTwitterAPIWrapper

+ (STTwitterAPIWrapper *)twitterAPIApplicationOnlyWithConsumerKey;

@end
