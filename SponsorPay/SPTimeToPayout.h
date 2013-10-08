//
//  SPTimeToPayout.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPConnectionManager.h"

@interface SPTimeToPayout : NSObject
@property (nonatomic, strong) NSString* amount;
@property (nonatomic, strong) NSString* readable;

-(id)initWithDictionary:(NSDictionary*) dictionary;
@end
