//
//  SPMainPhoneControllerViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainPhoneViewController.h"

@interface SPMainPhoneViewController (){
    UIScrollView *_mainScrollView;
}

@end

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

    
    //scroll
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _mainScrollView.contentSize = self.view.bounds.size;
    [self.view addSubview:_mainScrollView];
    
    
    //sponsor image
    CGSize imageSize = CGSizeMake(617/3, 105/3);
    CGFloat margin = (self.view.frame.size.width - imageSize.width)/2;
    UIImageView *sponsorImage = [[UIImageView alloc] initWithFrame:CGRectMake(margin, 30, imageSize.width, imageSize.height)];
    sponsorImage.image = [UIImage imageNamed:@"sponsorpay.png"];
    [_mainScrollView addSubview:sponsorImage];
    
    
    
    //identification
    UIFont *identificationFont = [UIFont lightItalicHelveticaWithSize:20];
    NSString *identificationText = NSLocalizedString(@"by Nuno Santos", @"identification");
    
    CGSize btnSize = [identificationText sizeWithAttributes:[NSDictionary dictionaryWithObject:identificationFont forKey:NSFontAttributeName]];
    UIButton *identificationButton = [[UIButton alloc] initWithFrame:CGRectMake(sponsorImage.frame.size.width + sponsorImage.frame.origin.x - btnSize.width, sponsorImage.frame.size.height + sponsorImage.frame.origin.y + 7, btnSize.width, 20)];
    [identificationButton setTitle:identificationText forState:UIControlStateNormal];
    identificationButton.titleLabel.font = identificationFont;
    [identificationButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_mainScrollView addSubview:identificationButton];
    
    CGFloat fieldsY = 200;
    CGFloat fieldsMargin = 33;
    
    //user id input
    SPCustomTextField *userIdTextField = [[SPCustomTextField alloc] initWithFrame:CGRectMake(sponsorImage.frame.origin.x, fieldsY, sponsorImage.frame.size.width, 25)];
    userIdTextField.placeholder = NSLocalizedString(@"User ID", @"User ID");
    userIdTextField.returnKeyType = UIReturnKeyNext;
    userIdTextField.tag = kTagUserIdTextField;
    [_mainScrollView addSubview:userIdTextField];

    fieldsY += fieldsMargin;

    //api key input
    SPCustomTextField *apiKeyTextField = [[SPCustomTextField alloc] initWithFrame:CGRectMake(sponsorImage.frame.origin.x, fieldsY, sponsorImage.frame.size.width, 25)];
    apiKeyTextField.placeholder = NSLocalizedString(@"Api Key", @"Api Key");
    apiKeyTextField.returnKeyType = UIReturnKeyNext;
    apiKeyTextField.tag = kTagApiKeyTextField;
    [_mainScrollView addSubview:apiKeyTextField];
    
    fieldsY += fieldsMargin;
    
    //app id input
    SPCustomTextField *appIdTextField = [[SPCustomTextField alloc] initWithFrame:CGRectMake(sponsorImage.frame.origin.x, fieldsY, sponsorImage.frame.size.width, 25)];
    appIdTextField.placeholder = NSLocalizedString(@"App ID", @"App ID");
    appIdTextField.returnKeyType = UIReturnKeyNext;
    appIdTextField.tag = kTagAppIdTextField;
    [_mainScrollView addSubview:appIdTextField];

    fieldsY += fieldsMargin;
    
    //app id input
    SPCustomTextField *customTextField = [[SPCustomTextField alloc] initWithFrame:CGRectMake(sponsorImage.frame.origin.x, fieldsY, sponsorImage.frame.size.width, 25)];
    customTextField.placeholder = NSLocalizedString(@"Custom", @"Custom");
    customTextField.returnKeyType = UIReturnKeyNext;
    customTextField.tag = kTagCustomTextField;
    [_mainScrollView addSubview:customTextField];

    
    
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark keyboard notifications
-(void)keyboardWillShow:(NSNotification *)notification{
    
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardFrame;
    
    [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    
    UIViewAnimationOptions animationOptions = animationCurve<<16;
    
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        _mainScrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height - keyboardFrame.size.height);
    } completion:^(BOOL finished) {
        [_mainScrollView setContentOffset:CGPointMake(0, 170) animated:YES];
    }];
    
    
}

-(void)keyboardWillHide:(NSNotification *)notification{
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    UIViewAnimationOptions animationOptions = animationCurve<<16;
    
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        _mainScrollView.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        
    }];

    
}

@end
