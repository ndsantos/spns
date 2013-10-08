//
//  SPConnectionManagerTests.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SPConnectionManager.h"

@interface SPConnectionManagerTests : XCTestCase

@end

@implementation SPConnectionManagerTests

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



- (void)testHashkeyFromParameters
{
    // params for testing were used as the demo provided in the online documentation
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"157", kParameterNameAppId,
                            @"player1", kParameterNameUserId,
                            @"212.45.111.17", kParameterNameIP,
                            @"de", kParameterNameLocale,
                            @"2b6f0cc904d137be2e1730235f5664094b831186", kParameterNameDeviceId,
                            @"1312211903", kParameterNameUserAccountTimestamp,
                            @"campaign2", kParameterNameCustom,
                            @"2", kParameterNamePage,
                            @"1312553361", kParameterNameTimestamp, nil];
    NSString *apikey = @"e95a21621a1865bcbae3bee89c4d4f84";
    
    NSString *expectedResponse = @"7a2b1604c03d46eec1ecd4a686787b75dd693c4d";
    
    NSString *hashkey = [[SPConnectionManager sharedInstance] hashkeyFromParams:params withApiKey:apikey];
    
    XCTAssertTrue([hashkey isEqualToString:expectedResponse], @"problem in algorithm");
}

-(void) testURLFromParams{
    // params for testing were used as the demo provided in the online documentation
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"157", kParameterNameAppId,
                            @"player1", kParameterNameUserId,
                            @"212.45.111.17", kParameterNameIP,
                            @"de", kParameterNameLocale,
                            @"2b6f0cc904d137be2e1730235f5664094b831186", kParameterNameDeviceId,
                            @"1312211903", kParameterNameUserAccountTimestamp,
                            @"campaign2", kParameterNameCustom,
                            @"2", kParameterNamePage,
                            @"1312553361", kParameterNameTimestamp, nil];
    
    XCTAssertNotNil([[SPConnectionManager sharedInstance] urlFromParams:params], @"URL cannot be nil");
    
    
}
@end
