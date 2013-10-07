//
// Created by Nuno Santos on 4/25/13.
// Copyright (c) 2013 HappinessProvider. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (hex)

+(UIColor*)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex ;
@end