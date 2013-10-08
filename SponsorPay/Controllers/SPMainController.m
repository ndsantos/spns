//
//  SPMainController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainController.h"
#import "SPConnectionManager.h"
#import "SPLinkedInViewController.h"


static NSString *sponsorCellId = @"SponsorCellID";
static NSString *formCellId = @"FormCellID";

@interface SPMainController(){
    UICollectionView *_collectionView;
}
@end

@implementation SPMainController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nil bundle:nil]){
        self.title = NSLocalizedString(@"Set Up", @"Main controller title");
    }
    return self;
}



-(void)viewDidLoad{
    
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
 
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;

    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[SPSponsorCell class] forCellWithReuseIdentifier:sponsorCellId];
    [_collectionView registerClass:[SPFormCell class] forCellWithReuseIdentifier:formCellId];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //keyboard notifications
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification object:nil];
    
    //Adjust collection for orientation
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)_collectionView.collectionViewLayout;
    if(self.view.bounds.size.width>self.view.bounds.size.height){
        layout.itemSize = CGSizeMake(_collectionView.frame.size.width/2, _collectionView.frame.size.height);
    } else {
        layout.itemSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.bounds.size.height/2);
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    withSuccessBlock:^(SPServerResponseObject *content) {
        
        [self showOffersControllerWithOffers:content.offers];
        
    } withFailureBlock:^(NSString *errorMsg) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Server error", @"Server error") message:errorMsg delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"ok").uppercaseString otherButtonTitles:nil] show];
    }];
        
    }
}


//implemented by subclasses
-(void)showOffersControllerWithOffers:(NSArray *)offers{
}


#pragma mark collection datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    
   
    if(indexPath.row == 0){
        SPSponsorCell *sponsorCell = [collectionView dequeueReusableCellWithReuseIdentifier:sponsorCellId forIndexPath:indexPath];
        sponsorCell.delegate = self;
        return sponsorCell;
    } else {
        SPFormCell* formCell = [collectionView dequeueReusableCellWithReuseIdentifier:formCellId forIndexPath:indexPath];
        formCell.delegate = self;
        return formCell;
        
    }
    return nil;
    
}

#pragma mark form cell delegate
-(void)didPressGoInFormCell:(SPFormCell *)formCell{
    [self requestDataFromServer];
}

#pragma mark sponsor delegate
-(void)wantsToShowLinkedIn{
    [self.navigationController pushViewController:[[SPLinkedInViewController alloc] initWithNibName:nil bundle:nil] animated:YES];
}

#pragma mark rotation


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)_collectionView.collectionViewLayout;
    if(UIInterfaceOrientationIsPortrait(fromInterfaceOrientation)){
      
        //landscape
        layout.itemSize = CGSizeMake(_collectionView.frame.size.width/2, _collectionView.frame.size.height);
        
    } else {
        //portrait
        layout.itemSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.frame.size.height/2);
    }
}


#pragma mark keyboard
-(void)keyboardWillShow:(NSNotification *)notification{
    
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    
    [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    
    UIViewAnimationOptions animationOptions = animationCurve<<16;
    
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        CGFloat keyboardHeight = keyboardFrame.size.height;
        if(UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)){
            keyboardHeight = keyboardFrame.size.width;
        }
        _collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height - keyboardHeight);
    } completion:^(BOOL finished) {
        _collectionView.contentSize = self.view.bounds.size;
    }];
    
    
    //show hide keyboard button
    //UIBarButtonItem *hideKeyboard = [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"keyboard_hide.png"] style:UIBarButtonItemStylePlain target:self.view action:<#(SEL)#>
    //self.navigationItem.rightBarButtonItem
}

-(void)keyboardWillHide:(NSNotification *)notification{
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    UIViewAnimationOptions animationOptions = animationCurve<<16;
    
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        _collectionView.frame = self.view.bounds;
        _collectionView.contentSize = self.view.bounds.size;
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
