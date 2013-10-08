//
//  SPOffersViewController.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPOffersCellProtocol.h"

@interface SPOffersViewController : UIViewController<UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *offers;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

@property (nonatomic, readonly) Class cellClass;

-(id)initWithOffers:(NSArray*) offers;

@end
