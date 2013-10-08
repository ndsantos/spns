//
//  SponsorPayTests.m
//  SponsorPayTests
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPConnectionManager.h"
#import "SPOffersPhoneViewController.h"


@interface SponsorPayTests : XCTestCase

@end

@implementation SponsorPayTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}







-(void) testCellClass{
    SPOffersPhoneViewController *offersPhoneController = [[SPOffersPhoneViewController alloc] init];
    
    XCTAssertNotNil(offersPhoneController.cellClass, @"Missing implementation of mandatory method in subclasses");
    
}


@end
