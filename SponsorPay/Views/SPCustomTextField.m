//
//  SPCustomTextField.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPCustomTextField.h"

@implementation SPCustomTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:17];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lineWidth = 2;
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetAlpha(context, 1);
    CGContextMoveToPoint(context, 0,self.frame.size.height - lineWidth);

    CGContextAddLineToPoint(context, self.bounds.size.width, self.frame.size.height - lineWidth);
    [[UIColor colorWithHexString:@"d80100"] setStroke];
    CGContextStrokePath(context);
}


@end
