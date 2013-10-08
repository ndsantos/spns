//
//  NSString+SHA1.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <CommonCrypto/CommonDigest.h>

@interface NSString(SHA1)


-(NSString*) sha1String;
@end
