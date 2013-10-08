//
//  SPMainController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainController.h"

@implementation SPMainController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nil bundle:nil]){
        self.title = NSLocalizedString(@"Set Up", @"Main controller title");
    }
    return self;
}

-(BOOL)validateForm{
    if([((UITextField*)[self.view viewWithTag:kTagUserIdTextField]).text isEqualToString:@""]){
        [self showError:NSLocalizedString(@"User ID is mandatory",@"User ID is mandatory")];
        return NO;
    }
    
    
    if([((UITextField*)[self.view viewWithTag:kTagApiKeyTextField]).text isEqualToString:@""]){
        [self showError:NSLocalizedString(@"Api Key is mandatory",@"Api Key is mandatory")];
        return NO;
    }
    
    if([((UITextField*)[self.view viewWithTag:kTagAppIdTextField]).text isEqualToString:@""]){
        [self showError:NSLocalizedString(@"App ID is mandatory",@"App ID is mandatory")];
        return NO;
    }
    
    return YES;
}

-(void)showError:(NSString *)errorMessage{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error in Form", @"Error in Form") message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

-(void)requestDataFromServer{

    //validate
    if([self validateForm]){
        
        //request
        [[SPConnectionManager sharedInstance] getServerContentForUserId:((UITextField*)[self.view viewWithTag:kTagUserIdTextField]).text
    withApiKey:((UITextField*)[self.view viewWithTag:kTagApiKeyTextField]).text
    withAppId:((UITextField*)[self.view viewWithTag:kTagAppIdTextField]).text
    withCustomParams:((UITextField*)[self.view viewWithTag:kTagCustomTextField]).text
    withSuccessBlock:^(NSArray *content) {
        
    } withFailureBlock:^(NSString *errorMsg) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Server error", @"Server error") message:errorMsg delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"ok").uppercaseString otherButtonTitles:nil] show];
    }];
        
    }
}
@end
