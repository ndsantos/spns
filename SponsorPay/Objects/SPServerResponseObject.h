//
//  SPServerResponseObject.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPOffer.h"
#import "SPConnectionManager.h"
#import "SPInformation.h"

@class SPInformation;


@interface SPServerResponseObject : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) SPInformation *information;
@property (nonatomic, strong) NSMutableArray *offers;





-(id)initWithDictionary:(NSDictionary*) dictionary;

@end
