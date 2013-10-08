//
//  SPInformation.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPInformation.h"

@implementation SPInformation

-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        _appName = dictionary[kResponseParameterAppName];
        _appId = dictionary[kResponseParameterAppID];
        _virtualCurrency = dictionary[kResponseParameterVirtualCurrency];
        _country = dictionary[kResponseParameterCountry];
        _language = dictionary[kResponseParameterLanguage];
        _supportURL = dictionary[kResponseParameterSupportURL];
    }
    return self;
}

@end
