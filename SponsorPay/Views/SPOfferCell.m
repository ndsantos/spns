//
//  SPOfferPhoneCell.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOfferCell.h"
#import "UIImageView+AFNetworking.h"

@interface SPOfferCell(){
    UIImageView *_thumbnailImageView;
    
    UILabel *_titleLabel;
    UITextView *_teaserTextView;
    UILabel *_payoutLabel;
}

@end
@implementation SPOfferCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    
        //image
        CGSize thumbnailSize = CGSizeMake(175/2, 175/2);
        CGFloat margin = (self.frame.size.height - thumbnailSize.height)/2;
        
        _thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, thumbnailSize.width, thumbnailSize.height)];
        [self addSubview:_thumbnailImageView];
        
        CGFloat titleX = _thumbnailImageView.frame.size.width + 2*margin;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, margin, self.frame.size.width - titleX - margin, 25)];
        _titleLabel.font = [UIFont helveticaWithSize:17];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_titleLabel];
        
        _teaserTextView = [[UITextView alloc] initWithFrame:CGRectMake(titleX, margin*2 + _titleLabel.frame.size.height, _titleLabel.frame.size.width, 40)];
        _teaserTextView.font = [UIFont lightHelveticaWithSize:15];
        _teaserTextView.contentInset = UIEdgeInsetsMake(-8, -8, -8, -8);
        _teaserTextView.editable = NO;
        _teaserTextView.scrollEnabled = NO;
        _teaserTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_teaserTextView];
        
        _payoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, self.frame.size.height - margin - 15, _titleLabel.frame.size.width, 15)];
        _payoutLabel.font = [UIFont lightItalicHelveticaWithSize:14];
        _payoutLabel.textAlignment = NSTextAlignmentRight;
        _payoutLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_payoutLabel];
        
        
    }
    return self;
}

-(void)setOffer:(SPOffer *)offer{
    [_thumbnailImageView setImageWithURL:[NSURL URLWithString:offer.thumbnailHiRes]];
    _titleLabel.text = offer.title;
    _teaserTextView.text = offer.teaser;
    _payoutLabel.text = [NSString stringWithFormat:@"%@: %@  ", NSLocalizedString(@"payout", @"payout").uppercaseString, offer.payout] ;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
