//
//  SPFormCell.m
//  SponsorPay
//
//  Created by Nuno Santos on 10/8/13.
//  Copyright (c) 2013 HappinessProvider. All rights reserved.
//

#import "SPFormCell.h"

@interface SPFormCell(){
    SPCustomTextField *_userIdTextField;
    SPCustomTextField *_apiKeyTextField;
    SPCustomTextField *_appIdTextField;
    SPCustomTextField *_customTextField;
    
    UIButton *_goButton;
    
}
-(void) goPressed;
@end
@implementation SPFormCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
     

        
        //user id input
        _userIdTextField = [[SPCustomTextField alloc] initWithFrame:CGRectZero];
        _userIdTextField.placeholder = NSLocalizedString(@"User ID", @"User ID");
        _userIdTextField.returnKeyType = UIReturnKeyNext;
        _userIdTextField.tag = kTagUserIdTextField;
        _userIdTextField.delegate = self;
        _userIdTextField.showDefaultButton = YES;
        _userIdTextField.defaultValue = kDefaultUserId;
        [self addSubview:_userIdTextField];
        
        //api key input
        _apiKeyTextField = [[SPCustomTextField alloc] initWithFrame:CGRectZero];
        _apiKeyTextField.placeholder = NSLocalizedString(@"Api Key", @"Api Key");
        _apiKeyTextField.returnKeyType = UIReturnKeyNext;
        _apiKeyTextField.tag = kTagApiKeyTextField;
        _apiKeyTextField.delegate = self;
        _apiKeyTextField.showDefaultButton = YES;
        _apiKeyTextField.defaultValue = kDefaultApiKey;
        [self addSubview:_apiKeyTextField];
        
        
        //app id input
        _appIdTextField = [[SPCustomTextField alloc] initWithFrame:CGRectZero];
        _appIdTextField.placeholder = NSLocalizedString(@"App ID", @"App ID");
        _appIdTextField.returnKeyType = UIReturnKeyNext;
        _appIdTextField.tag = kTagAppIdTextField;
        _appIdTextField.delegate = self;
        _appIdTextField.showDefaultButton = YES;
        _appIdTextField.defaultValue = kDefaultAppId;
        [self addSubview:_appIdTextField];
      
        //app id input
        _customTextField = [[SPCustomTextField alloc] initWithFrame:CGRectZero];
        _customTextField.placeholder = NSLocalizedString(@"Custom", @"Custom");
        _customTextField.returnKeyType = UIReturnKeyGo;
        _customTextField.tag = kTagCustomTextField;
        _customTextField.delegate = self;
        [self addSubview:_customTextField];
        
        
        _goButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_goButton setTitle:NSLocalizedString(@"go", @"go").uppercaseString forState:UIControlStateNormal];
        _goButton.backgroundColor = [UIColor colorWithHexString:@"d80100"];
        _goButton.titleLabel.font = [UIFont lightHelveticaWithSize:15];
        [_goButton addTarget:self action:@selector(goPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_goButton];
        
    }
    return self;
}

-(void)layoutSubviews{
    CGFloat goButtonHeight= 20;
    CGFloat fieldsMargin = 33;
    CGFloat fieldHeigh = 25;
    CGFloat fieldsY = (self.frame.size.height - (4*fieldHeigh + 3*fieldsMargin+goButtonHeight))/2;
    
    if(self.frame.size.width<self.frame.size.height){
        fieldsY+=40;
    }
    
    CGFloat fieldWidth = 200;
    if(self.frame.size.width>400){
        fieldWidth = 400;
    }
    
    CGFloat fieldsX = (self.frame.size.width - fieldWidth)/2;
    
    
    
    CGSize goButtonSize = CGSizeMake(43, goButtonHeight);
    
    _userIdTextField.frame = CGRectMake(fieldsX, fieldsY, fieldWidth, fieldHeigh);
    
    fieldsY += fieldsMargin;
    
    _apiKeyTextField.frame = CGRectMake(fieldsX, fieldsY, fieldWidth, fieldHeigh);
   
    fieldsY += fieldsMargin;
    
    _appIdTextField.frame = CGRectMake(fieldsX, fieldsY, fieldWidth, fieldHeigh);
   
    fieldsY += fieldsMargin;
    
    _customTextField.frame = CGRectMake(fieldsX, fieldsY, fieldWidth, fieldHeigh);
    
    _goButton.frame = CGRectMake(_customTextField.frame.origin.x + _customTextField.frame.size.width - goButtonSize.width, _customTextField.frame.origin.y + _customTextField.frame.size.height + 3, goButtonSize.width, goButtonSize.height);
    
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) goPressed{
    [_delegate didPressGoInFormCell:self];
}


#pragma mark text field delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    switch (textField.tag) {
        case kTagUserIdTextField:{
            [((UITextField *) [self viewWithTag:kTagApiKeyTextField]) becomeFirstResponder];
            break;
        }
        case kTagApiKeyTextField:{
            [((UITextField *) [self viewWithTag:kTagAppIdTextField]) becomeFirstResponder];
            break;
        }
        case kTagAppIdTextField:{
            [((UITextField *) [self viewWithTag:kTagCustomTextField]) becomeFirstResponder];
            break;
        }
        case kTagCustomTextField:{
            [textField resignFirstResponder];
            // request
            [_delegate didPressGoInFormCell:self];
            break;
        }
        default:
            break;
    }
    return YES;
}


@end
