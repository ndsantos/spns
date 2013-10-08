//
//  SPOffersPadViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOffersPadViewController.h"
#import "SPOfferCell.h"

@interface SPOffersPadViewController ()

@end

@implementation SPOffersPadViewController

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    layout.itemSize = CGSizeMake(self.view.bounds.size.width/3 - 2*2, 100);
    layout.minimumInteritemSpacing = 2;
    layout.minimumLineSpacing = 2;
}

-(Class)cellClass{
    return [SPOfferCell class];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark rotations
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3 - 2*layout.minimumInteritemSpacing, layout.itemSize.height);
    } else {
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.height/3 - 2*layout.minimumInteritemSpacing, layout.itemSize.height);
    }
    
    
}
@end
