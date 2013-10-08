//
//  SPConnectionManager.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPConnectionManager.h"
@interface SPConnectionManager(){
    NSOperationQueue *_connectionOperationQueue;
}
@end

@implementation SPConnectionManager

-(id)init{
    if(self = [super init]){
        _connectionOperationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

+ (SPConnectionManager*)sharedInstance
{
    static dispatch_once_t onceToken;
    static SPConnectionManager *singleton;
    
    dispatch_once(&onceToken, ^{
        singleton = [[SPConnectionManager alloc] init];
    });
    
    return singleton;
}

#pragma mark properties

- (NSString *)ipAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}

-(NSString *)locale{
    return [NSLocale preferredLanguages][0];
}

-(NSString *)offerTypes{
    return @"112";
}

-(NSString *)deviceId{
    return [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
}

#pragma mark requests
-(void)getServerContentForUserId:(NSString *)userId withApiKey:(NSString *)apiKey withAppId:(NSString *)appId withCustomParams:(NSString *)customParams withSuccessBlock:(void (^)(NSArray *content))successBlock withFailureBlock:(void (^)(NSString *errorMsg))errorBlock{
    
    
    //prepare parameters
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:userId, kParameterNameUserId, appId, kParameterNameAppId, self.ipAddress, kParameterNameIP, self.locale, kParameterNameLocale, self.offerTypes, kParameterNameOfferTypes, self.deviceId, kParameterNameDeviceId,  nil];
    
    if(![customParams isEqualToString:@""]){
        [params setValue:customParams forKey:kParameterNameCustom];
    }
    [params setValue:[NSString stringWithFormat:@"%i", (int)[NSDate date].timeIntervalSince1970] forKey:kParameterNameTimestamp];
    [params setValue:[self hashkeyFromParams:params withApiKey:apiKey] forKey:kParameterNameHashkey];
    
    
    // create request
    NSURL *url = [self urlFromParams:params];
    NSLog(@"%@", url);
    AFHTTPRequestOperation *request = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url]];
    
    //set serializer to json
    request.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [request setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if([[NSString stringWithFormat:@"%@%@", operation.responseString, apiKey].sha1String isEqualToString:[operation.response.allHeaderFields valueForKey:@"X-Sponsorpay-Response-Signature"]]){

            
            
            NSLog(@"%@", responseObject);
            
        } else {
            errorBlock(NSLocalizedString(@"Could not verify the content from server", @"Could not verify the content from server"));
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSString *errorMsg = error.localizedDescription;
        if(operation.responseData!=nil){
            NSError *errorJSON;
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:operation.responseData options:kNilOptions error:&errorJSON];
            errorMsg = response[kResponseParameterMessage];
        }
        errorBlock(errorMsg);
        
    }];
    
    [_connectionOperationQueue addOperation:request];
    
    
    
    
}


#pragma mark processes
-(NSString *)hashkeyFromParams:(NSDictionary *)params withApiKey:(NSString *)apiKey{
    
    // Get all request parameters and their values (except hashkey)
    NSArray *requestParameters = params.allKeys;
    
    //Order theses pairs alphabetically by parameter name
    NSArray *sortedParameters = [requestParameters sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    
    NSMutableString *orderedPairs = [[NSMutableString alloc] init];
    for(NSString *parameter in sortedParameters){
        [orderedPairs appendFormat:@"%@=%@&", parameter, params[parameter]];
    }
    
    
    //Concatenate the resulting string with & and the API Key handed out to you by SponsorPay
    [orderedPairs appendString:apiKey];
    
    //Hash the whole resulting string, using SHA1. The resulting hashkey is then appended to the request as a separate parameter.
    
    return orderedPairs.sha1String;
}


-(NSURL *)urlFromParams:(NSDictionary *)params{
    NSMutableString *orderedPairs = [[NSMutableString alloc] init];
    for(NSString *parameterName in params.allKeys){
        [orderedPairs appendFormat:@"%@=%@&", parameterName, params[parameterName]];
    }
    NSString *parametersString = [orderedPairs substringToIndex:orderedPairs.length-1];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kURLBase, parametersString]];
}
@end
