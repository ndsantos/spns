//
//  SPCustomTextField.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPCustomTextField.h"

@interface SPCustomTextField (){
    UIButton *_defaultButon;
}

-(void) setDefaultText;

@end

@implementation SPCustomTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:17];
        
        // default button
        UIFont *defaultStringFont = [UIFont boldHelveticaWithSize:9];
        NSString *defaultString = NSLocalizedString(@"default", @"default").uppercaseString;
        CGSize defaultTextSize = [defaultString sizeWithAttributes:[NSDictionary dictionaryWithObject:defaultStringFont forKey:NSFontAttributeName]];
        _defaultButon = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - defaultTextSize.width, 5, defaultTextSize.width, 15)];
        [_defaultButon setTitle:defaultString forState:UIControlStateNormal];
        [_defaultButon setTitleColor:[UIColor colorWithHexString:@"070707"] forState:UIControlStateNormal];
        [_defaultButon addTarget:self action:@selector(setDefaultText) forControlEvents:UIControlEventTouchUpInside];
        _defaultButon.hidden = YES;
        _defaultButon.titleLabel.font = defaultStringFont;
        [self addSubview:_defaultButon];
        
    }
    return self;
}

-(void)setDefaultText{
    self.text = _defaultValue;
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
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:@"d80100"].CGColor);
    
    CGContextStrokePath(context);
}


-(CGRect)textRectForBounds:(CGRect)bounds{
    if(_showDefaultButton){
        return CGRectMake(0, 0, bounds.size.width - _defaultButon.frame.size.width, bounds.size.height);
    }
    return bounds;
}

-(CGRect)editingRectForBounds:(CGRect)bounds{
    return [self textRectForBounds:bounds];
}

-(void)setShowDefaultButton:(BOOL)showDefaultButton{

    _showDefaultButton = showDefaultButton;
    _defaultButon.hidden = !showDefaultButton;

}

@end
