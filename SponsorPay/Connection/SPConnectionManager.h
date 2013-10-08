//
//  SPConnectionManager.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//
/* 
 Class that will be responsible for handling the connection and parsing from server
 */


#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <AdSupport/AdSupport.h>
#import "AFNetworking.h"
#import "SPServerResponseObject.h"


#define kURLBase @"http://api.sponsorpay.com/feed/v1/offers.json?"

#define kParameterNameAppId                 @"appid"
#define kParameterNameUserId                @"uid"
#define kParameterNameIP                    @"ip"
#define kParameterNameLocale                @"locale"
#define kParameterNameDeviceId              @"device_id"
#define kParameterNameUserAccountTimestamp  @"ps_time"
#define kParameterNameCustom                @"pub0"
#define kParameterNameTimestamp             @"timestamp"
#define kParameterNameOfferTypes            @"offer_types"
#define kParameterNameHashkey               @"hashkey"
#define kParameterNamePage                  @"page"


#define kResponseParameterMessage           @"message"
#define kResponseParameterCode              @"code"
#define kResponseParameterCount             @"count"
#define kResponseParameterPages             @"pages"
#define kResponseParameterInformation       @"information"

#define kResponseParameterAppName           @"app_name"
#define kResponseParameterAppID             @"appid"
#define kResponseParameterVirtualCurrency   @"virtual_currency"
#define kResponseParameterCountry           @"country"
#define kResponseParameterLanguage          @"language"
#define kResponseParameterSupportURL        @"support_url"

#define kResponseParameterOffers            @"offers"
#define kResponseParameterTitle             @"title"
#define kResponseParameterOfferId           @"offer_id"
#define kResponseParameterTeaser            @"teaser"
#define kResponseParameterRequiredActions   @"required_actions"
#define kResponseParameterLink              @"link"
#define kResponseParameterOfferTypes        @"offer_types"
#define kResponseParameterOfferTypeId       @"offer_type_id"
#define kResponseParameterReadable          @"readable"

#define kResponseParameterThumbnail         @"thumbnail"
#define kResponseParameterLowRes            @"lowres"
#define kResponseParameterHiRes             @"hires"

#define kResponseParameterPayout            @"payout"
#define kResponseParameterTimeToPayout      @"time_to_payout"

#define kResponseParameterAmount            @"amount"

@class SPServerResponseObject;

@interface SPConnectionManager : NSObject

+ (SPConnectionManager*)sharedInstance;

@property (nonatomic, readonly) NSString *ipAddress;
@property (nonatomic, readonly) NSString *locale;
@property (nonatomic, readonly) NSString *deviceId;
@property (nonatomic, readonly) NSString *offerTypes;


// get content from server
// 1. mount all the params
// 2. generate hashkey
// 3. parse content
-(void)getServerContentForUserId:(NSString *)userId withApiKey:(NSString *)apiKey withAppId:(NSString *)appId withCustomParams:(NSString *)customParams withSuccessBlock:(void (^)(SPServerResponseObject *content))successBlock withFailureBlock:(void (^)(NSString *errorMsg))errorBlock;


-(NSString *) hashkeyFromParams:(NSDictionary*) params withApiKey:(NSString *) apiKey;

-(NSURL*) urlFromParams:(NSDictionary*) params;

@end
