//
//  SPOffersViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPOffersViewController.h"

@interface SPOffersViewController (){
    UICollectionView *_collectionView;
}

@end

static NSString *offerCellId = @"OfferCellId";

@implementation SPOffersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithOffers:(NSArray *)offers{
    if(self = [self initWithNibName:nil bundle:nil]){
        self.offers = offers;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = NSLocalizedString(@"Offers", @"Offers");
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [_collectionView registerClass:self.cellClass forCellWithReuseIdentifier:offerCellId];
    
    _collectionView.dataSource = self;
    
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _offers.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell<SPOffersCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:offerCellId forIndexPath:indexPath];
    
    [cell setOffer:_offers[indexPath.row]];
    
    return cell;
}

@end
