//
//  SPMainController.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.

/*

This class is responsible for:
 
 1 - support UI for user input
 2 - Validation and alerts
 3 - in case the success,  navigate to a new controller

*/
#import <UIKit/UIKit.h>
#import "SPSponsorCell.h"
#import "SPFormCell.h"


@interface SPMainController : UIViewController<UICollectionViewDataSource, SPFormCellDelegate>

-(void) requestDataFromServer;
-(BOOL) validateForm;

-(void) showError:(NSString*) errorMessage;

-(void) showOffersControllerWithOffers:(NSArray*) offers;



-(void) keyboardWillShow:(NSNotification*) notification;
-(void) keyboardWillHide:(NSNotification *)notification;
@end
