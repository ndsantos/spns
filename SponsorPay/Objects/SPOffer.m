//
//  SPOffer.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOffer.h"

@implementation SPOffer

-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        _title = dictionary[kResponseParameterTitle];
        _offerId = dictionary[kResponseParameterOfferId];
        _teaser = dictionary[kResponseParameterTeaser];
        _requiredActions = dictionary[kResponseParameterRequiredActions];
        _link = dictionary[kResponseParameterLink];
        
        NSArray *offerTypesDic = dictionary[kResponseParameterOfferTypes];
        _types = [[NSMutableArray alloc] initWithCapacity:offerTypesDic.count];
        for (NSDictionary *offerTypeDic in offerTypesDic) {
            [_types addObject:[[SPOfferType alloc] initWithDictionary:offerTypeDic]];
        }
        
        NSDictionary *thumbs = dictionary[kResponseParameterThumbnail];
        _thumbnailHiRes = thumbs[kResponseParameterHiRes];
        _thumbnailLowRes = thumbs[kResponseParameterLowRes];
        
        _payout = dictionary[kResponseParameterPayout];
        
        _timeToPayout = [[SPTimeToPayout alloc] initWithDictionary:dictionary[kResponseParameterTimeToPayout]];
        
    }
    return self;
}

@end
