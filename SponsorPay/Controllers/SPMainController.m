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
        return YES;
    }
    
    
    if([((UITextField*)[self.view viewWithTag:kTagApiKeyTextField]).text isEqualToString:@""]){
        [self showError:NSLocalizedString(@"Api Key is mandatory",@"Api Key is mandatory")];
        return YES;
    }
    
    if([((UITextField*)[self.view viewWithTag:kTagAppIdTextField]).text isEqualToString:@""]){
        [self showError:NSLocalizedString(@"App ID is mandatory",@"App ID is mandatory")];
        return YES;
    }
    
    return NO;
}

-(void)showError:(NSString *)errorMessage{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error in Form", @"Error in Form") message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

-(void)requestDataFromServer{

    //validate
    if([self validateForm]){
        
        //request
        
        
    }
}
@end
