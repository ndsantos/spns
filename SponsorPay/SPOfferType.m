//
//  SPOfferType.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOfferType.h"


@implementation SPOfferType

-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        _typeId = dictionary[kResponseParameterOfferTypeId];
        _readable = dictionary[kResponseParameterReadable];
    }
    return self;
}
@end
