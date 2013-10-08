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

	
}

-(void)viewWillAppear:(BOOL)animated{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    layout.itemSize = CGSizeMake(self.view.bounds.size.width, 100);
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

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, layout.itemSize.height);
    } else {
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, layout.itemSize.height);
    }
    
    
}

@end
