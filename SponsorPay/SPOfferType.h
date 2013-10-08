//
//  SPOfferType.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPConnectionManager.h"

@interface SPOfferType : NSObject

@property (nonatomic, strong) NSString* typeId;
@property (nonatomic, strong) NSString* readable;

-(id)initWithDictionary:(NSDictionary*) dictionary;
@end
