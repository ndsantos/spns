//
//  SPInformation.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPConnectionManager.h"

@interface SPInformation : NSObject

@property (nonatomic, strong) NSString* appName;
@property (nonatomic, strong) NSString* appId;
@property (nonatomic, strong) NSString* virtualCurrency;
@property (nonatomic, strong) NSString* country;
@property (nonatomic, strong) NSString* language;
@property (nonatomic, strong) NSString* supportURL;


-(id)initWithDictionary:(NSDictionary*) dictionary;

@end
