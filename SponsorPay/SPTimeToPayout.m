//
//  SPTimeToPayout.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPTimeToPayout.h"

@implementation SPTimeToPayout

-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        _amount = dictionary[kResponseParameterAmount];
        _readable = dictionary[kResponseParameterReadable];
    }
    return self;
}
@end
