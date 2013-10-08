//
//  SPFormCell.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPCustomTextField.h"

#define kTagUserIdTextField     3423
#define kTagApiKeyTextField     3424
#define kTagAppIdTextField      3425
#define kTagCustomTextField     3426

#define kDefaultAppId               @"2070"
#define kDefaultApiKey              @"1c915e3b5d42d05136185030892fbb846c278927"
#define kDefaultUserId              @"spiderman"

@protocol SPFormCellDelegate;

@interface SPFormCell : UICollectionViewCell<UITextFieldDelegate>

@property (nonatomic, weak) id<SPFormCellDelegate> delegate;

@end


@protocol SPFormCellDelegate <NSObject>

-(void) didPressGoInFormCell:(SPFormCell*) formCell;

@end