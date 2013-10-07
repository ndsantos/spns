//
//  SPMainPhoneControllerViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainPhoneViewController.h"

@interface SPMainPhoneViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGSize imageSize = CGSizeMake(617/3, 105/3);
    CGFloat margin = (self.view.frame.size.width - imageSize.width)/2;
    UIImageView *sponsorImage = [[UIImageView alloc] initWithFrame:CGRectMake(margin, 30, imageSize.width, imageSize.height)];
    sponsorImage.image = [UIImage imageNamed:@"sponsorpay.png"];
    [self.view addSubview:sponsorImage];
    
    UIFont *identificationFont = [UIFont lightItalicHelveticaWithSize:20];
    NSString *identificationText = NSLocalizedString(@"by Nuno Santos", @"identification");
    
    CGSize btnSize = [identificationText sizeWithAttributes:[NSDictionary dictionaryWithObject:identificationFont forKey:NSFontAttributeName]];
    UIButton *identificationButton = [[UIButton alloc] initWithFrame:CGRectMake(sponsorImage.frame.size.width + sponsorImage.frame.origin.x - btnSize.width, sponsorImage.frame.size.height + sponsorImage.frame.origin.y + 7, btnSize.width, 20)];
    [identificationButton setTitle:identificationText forState:UIControlStateNormal];
    identificationButton.titleLabel.font = identificationFont;
    [identificationButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:identificationButton];

    
    
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
