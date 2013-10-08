//
//  SPOffersViewControllerTests.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPOffersPadViewController.h"
#import "SPOffersPhoneViewController.h"

@interface SPOffersViewControllerTests : XCTestCase

@end

@implementation SPOffersViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testCellClassPhone
{
    SPOffersPhoneViewController *offersPhoneController = [[SPOffersPhoneViewController alloc] init];
    XCTAssertNotNil(offersPhoneController.cellClass, @"class for cell in iphone cannot be nil");
}

-(void)testCellClassPad{
    SPOffersPadViewController *offersPadController = [[SPOffersPadViewController alloc] init];
    XCTAssertNotNil(offersPadController.cellClass, @"class for cell in ipad cannot be nil");
}

@end
