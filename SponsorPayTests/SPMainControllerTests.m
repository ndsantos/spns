//
//  SPMainControllerTests.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPMainController.h"
#import "SPMainPadViewController.h"
#import "SPMainPhoneViewController.h"

@interface SPMainControllerTests : XCTestCase

@end

@implementation SPMainControllerTests

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

-(void) testPhoneShowOffers{
    SPMainPhoneViewController *phoneMainController = [[SPMainPhoneViewController alloc] init];
    XCTAssertTrue([phoneMainController respondsToSelector:@selector(showOffersControllerWithOffers:)], @"Phone main controller need to respond to this method");
}

-(void) testPadShowOffers{
    SPMainPadViewController *padMainController = [[SPMainPadViewController alloc] init];
    XCTAssertTrue([padMainController respondsToSelector:@selector(showOffersControllerWithOffers:)], @"Pad main controller need to respond to this method");
}

@end
