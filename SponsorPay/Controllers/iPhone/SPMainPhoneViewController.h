//
//  SPMainPhoneControllerViewController.h
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//
/**
 
 supporting views for iPad
 
 */

#import "SPMainController.h"
#import "SPCustomTextField.h"

@interface SPMainPhoneViewController : SPMainController


//keyboard events
-(void) keyboardWillShow:(NSNotification*) notification;
-(void) keyboardWillHide:(NSNotification *)notification;

@end
