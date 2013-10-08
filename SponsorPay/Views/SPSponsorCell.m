//
//  SPSponsorCell.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPSponsorCell.h"

@interface SPSponsorCell (){
    UIImageView *_sponsorImage;
    UIButton *_identificationButton;
}
-(void) showLinkedIn;

@end

@implementation SPSponsorCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
        //sponsor image
        _sponsorImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _sponsorImage.image = [UIImage imageNamed:@"sponsorpay.png"];

        [self addSubview:_sponsorImage];
        
        
        
        //identification
        UIFont *identificationFont = [UIFont lightItalicHelveticaWithSize:20];
        NSString *identificationText = NSLocalizedString(@"by Nuno Santos", @"identification");
        
        _identificationButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_identificationButton setTitle:identificationText forState:UIControlStateNormal];
        _identificationButton.titleLabel.font = identificationFont;
        [_identificationButton addTarget:self action:@selector(showLinkedIn) forControlEvents:UIControlEventTouchUpInside];
        [_identificationButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self addSubview:_identificationButton];

        
    }
    return self;
}

-(void)layoutSubviews{
    CGSize imageSize = CGSizeMake(617/3, 105/3);
    CGFloat margin = (self.frame.size.width - imageSize.width)/2;
    _sponsorImage.frame = CGRectMake(margin, (self.frame.size.height - imageSize.height)/2 - imageSize.height/2, imageSize.width, imageSize.height);
    
    
    CGSize btnSize = [_identificationButton.titleLabel.text sizeWithFont:_identificationButton.titleLabel.font];
    _identificationButton.frame = CGRectMake(_sponsorImage.frame.size.width + _sponsorImage.frame.origin.x - btnSize.width, _sponsorImage.frame.size.height + _sponsorImage.frame.origin.y + 7, btnSize.width, 20);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)showLinkedIn{
    [_delegate wantsToShowLinkedIn];
}

@end
