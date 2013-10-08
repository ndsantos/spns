//
//  SPOffersPhoneViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOffersPhoneViewController.h"

@interface SPOffersPhoneViewController ()

@end

@implementation SPOffersPhoneViewController

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
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    layout.itemSize = CGSizeMake(self.view.bounds.size.width, 70);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 2;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Class)cellClass{
    return [SPOfferPhoneCell class];
}

@end
