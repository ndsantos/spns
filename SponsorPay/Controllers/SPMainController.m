//
//  SPMainController.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/7/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPMainController.h"

@implementation SPMainController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nil bundle:nil]){
        self.title = NSLocalizedString(@"Set Up", @"Main controller title");
    }
    return self;
}
@end
