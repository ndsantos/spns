//
//  SPMainPhoneControllerViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainPhoneViewController.h"
#import "SPOffersPhoneViewController.h"


@implementation SPMainPhoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification object:nil];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    

    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    singleTapRecognizer.numberOfTapsRequired = 1;
    singleTapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:singleTapRecognizer];
    
 }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark keyboard notifications

-(void) hideKeyboard{
    [[self.view viewWithTag:kTagUserIdTextField] resignFirstResponder];
    [[self.view viewWithTag:kTagApiKeyTextField] resignFirstResponder];
    [[self.view viewWithTag:kTagAppIdTextField] resignFirstResponder];
    [[self.view viewWithTag:kTagCustomTextField] resignFirstResponder];
}




#pragma mark navigation

-(void)showOffersControllerWithOffers:(NSArray *)offers{
    SPOffersPhoneViewController *offersController = [[SPOffersPhoneViewController alloc] initWithOffers:offers];
    [self.navigationController pushViewController:offersController animated:YES];
    
}





@end
