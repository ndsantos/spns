//
// Created by Nuno Santos on 4/25/13.
// Copyright (c) 2013 HappinessProvider. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIColor+hex.h"


@implementation UIColor (hex)

+(UIColor*)colorWithHexString:(NSString *)hex{
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [UIColor colorWithRGBHex:hexNum];
}
+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [[UIColor alloc] initWithRed:r / 255.0f
                                  green:g / 255.0f
                                   blue:b / 255.0f
                                  alpha:1.0f];

}
@end