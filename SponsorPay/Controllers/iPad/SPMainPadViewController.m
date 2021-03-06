//
//  SPMainPadViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainPadViewController.h"
#import "SPOffersPadViewController.h"

@interface SPMainPadViewController ()

@end

@implementation SPMainPadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showOffersControllerWithOffers:(NSArray *)offers{
    SPOffersPadViewController *offersController = [[SPOffersPadViewController alloc] initWithOffers:offers];
    [self.navigationController pushViewController:offersController animated:YES];
}

@end
