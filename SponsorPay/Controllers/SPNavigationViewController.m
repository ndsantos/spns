//
//  SPNavigationViewController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPNavigationViewController.h"

@interface SPNavigationViewController ()

@end

@implementation SPNavigationViewController

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

-(NSUInteger)supportedInterfaceOrientations{
    if ([self.visibleViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.visibleViewController supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

-(BOOL)shouldAutorotate{
    if ([self.visibleViewController respondsToSelector:@selector(shouldAutorotate)]) {
        return [self.visibleViewController shouldAutorotate];
    }
    return YES;
}



@end
