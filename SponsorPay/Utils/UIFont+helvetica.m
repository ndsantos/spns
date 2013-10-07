//
// Created by Nuno Santos on 4/25/13.
// Copyright (c) 2013 HappinessProvider. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIFont+helvetica.h"


@implementation UIFont (helvetica)

+(UIFont *)lightHelveticaWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica-Light" size:size];
}
+(UIFont *)lightItalicHelveticaWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica-LightOblique" size:size];
}
+(UIFont*) helveticaWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica" size:size];
}

+(UIFont *)boldHelveticaWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}
@end