//
//  SPOffer.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPConnectionManager.h"
#import "SPOfferType.h"
#import "SPTimeToPayout.h"

@class SPTimeToPayout;

@interface SPOffer : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* offerId;
@property (nonatomic, strong) NSString* teaser;
@property (nonatomic, strong) NSString* requiredActions;
@property (nonatomic, strong) NSString* link;
@property (nonatomic, strong) NSMutableArray* types;
@property (nonatomic, strong) NSString* thumbnailLowRes;
@property (nonatomic, strong) NSString* thumbnailHiRes;
@property (nonatomic, strong) NSString* payout;
@property (nonatomic, strong) SPTimeToPayout *timeToPayout;

-(id)initWithDictionary:(NSDictionary*) dictionary;
@end
