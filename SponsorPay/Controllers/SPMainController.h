//
//  SPMainController.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.

/*

This class is responsible for:
 
 1 - support UI for user input
 2 - Validation and alerts
 3 - in case the success,  navigate to a new controller

*/

#define kTagUserIdTextField     3423
#define kTagApiKeyTextField     3424
#define kTagAppIdTextField      3425
#define kTagCustomTextField     3426

#define kDefaultAppId               @"2070"
#define kDefaultApiKey              @"1c915e3b5d42d05136185030892fbb846c278927"
#define kDefaultUserId              @"spiderman"

#import <UIKit/UIKit.h>

@interface SPMainController : UIViewController

-(void) requestDataFromServer;
-(BOOL) validateForm;

-(void) showError:(NSString*) errorMessage;

@end
