//
//  SPServerResponseObject.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPServerResponseObject.h"

@implementation SPServerResponseObject

-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        _code = dictionary[kResponseParameterCode];
        _message = dictionary[kResponseParameterMessage];
        _count = dictionary[kResponseParameterCount];
        _pages = dictionary[kResponseParameterPages];
        _information = [[SPInformation alloc] initWithDictionary:dictionary[kResponseParameterInformation]];
        
        NSArray *dicOffers = dictionary[kResponseParameterOffers];
        _offers = [[NSMutableArray alloc] initWithCapacity:dicOffers.count];
        for(NSDictionary* dicOffer in dicOffers){
            [_offers addObject:[[SPOffer alloc] initWithDictionary:dicOffer]];
        }
        
    }
    return self;
}

@end
