//
//  NSSTring_sha1Tests.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSSTring_sha1Tests : XCTestCase

@end

@implementation NSSTring_sha1Tests

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

-(void) testSHA1String{
    
    NSString *testString = @"The quick brown fox jumps over the lazy dog.";
    NSString *expectedResult = @"408d94384216f890ff7a0c3528e8bed1e0b01621";
    
    XCTAssertTrue([testString.sha1String isEqualToString:expectedResult], @"SHA1 issue");
}

@end
