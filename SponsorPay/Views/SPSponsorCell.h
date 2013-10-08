//
//  SPSponsorCell.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SPSponsorCellDelegate;

@interface SPSponsorCell : UICollectionViewCell


@property (nonatomic, weak) id<SPSponsorCellDelegate> delegate;

@end

@protocol SPSponsorCellDelegate <NSObject>

-(void) wantsToShowLinkedIn;

@end
