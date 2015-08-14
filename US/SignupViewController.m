//
//  SignupViewController.m
//  US
//
//  Created by NingFangming on 8/11/15.
//
//

#import "SignupViewController.h"

#import <Parse/Parse.h>


@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //background image
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"loginBg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //define screen width & length
    CGFloat halfWidth = [UIScreen mainScreen].bounds.size.width/2; //Half Width
    CGFloat halfLength = [UIScreen mainScreen].bounds.size.height/2; //Half Heigh
    
    //login color
    UIColor *loginColor = [self colorWithHexString:@"959797"];
    
    //LOGIN Username Line
    UIImageView *usernameLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength -60, 226, 1)];
    usernameLine.image=[UIImage imageNamed:@"loginLine.png"];
    usernameLine.contentMode = UIViewContentModeScaleToFill;
    
    //PW Line
    UIImageView *PWLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength +10, 226, 1)];
    PWLine.image=[UIImage imageNamed:@"loginLine.png"];
    PWLine.contentMode = UIViewContentModeScaleToFill;
    
    // PW Confirm Line
    UIImageView *PWConfirmLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength +80, 226, 1)];
    PWConfirmLine.image=[UIImage imageNamed:@"loginLine.png"];
    PWConfirmLine.contentMode = UIViewContentModeScaleToFill;
    
    // Email Line
    UIImageView *emailLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength +150, 226, 1)];
    emailLine.image=[UIImage imageNamed:@"loginLine.png"];
    emailLine.contentMode = UIViewContentModeScaleToFill;
    
    //Username Icon
    UIImageView *usernameIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength - 100, 30, 30)];
    usernameIcon.image=[UIImage imageNamed:@"loginUsernameIcon.png"];
    usernameIcon.contentMode = UIViewContentModeScaleToFill;
    
    //PW Icon
    UIImageView *PWIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength -30, 30, 30)];
    PWIcon.image=[UIImage imageNamed:@"loginPWIcon.png"];
    PWIcon.contentMode = UIViewContentModeScaleToFill;
    
    //PW Confirm Icon
    UIImageView *PWConfirmIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength + 40, 30, 30)];
    PWConfirmIcon.image=[UIImage imageNamed:@"loginPWIcon.png"];
    PWConfirmIcon.contentMode = UIViewContentModeScaleToFill;
    
    //Email Icon
    UIImageView *emailIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength + 110, 30, 30)];
    emailIcon.image=[UIImage imageNamed:@"emailIcon.png"];
    emailIcon.contentMode = UIViewContentModeScaleToFill;
    
    //Username Textfield
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength - 100, 190, 30)];
    usernameTextField.textColor = [UIColor whiteColor];
    usernameTextField.backgroundColor = [UIColor clearColor];
    UIColor *placeholderColor = [self colorWithHexString:@"1E1E1E"];
    usernameTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    usernameTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //PW Textfield
    PWTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength -30, 190, 30)];
    PWTextField.textColor = [UIColor whiteColor];
    PWTextField.backgroundColor = [UIColor clearColor];
    PWTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    PWTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    PWTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PWTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //PW Confirm Textfield
    PWConfirmTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength + 40, 190, 30)];
    PWConfirmTextField.textColor = [UIColor whiteColor];
    PWConfirmTextField.backgroundColor = [UIColor clearColor];
    PWConfirmTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    PWConfirmTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    PWConfirmTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PWConfirmTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //Email Textfield
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength + 110, 190, 30)];
    emailTextField.textColor = [UIColor whiteColor];
    emailTextField.backgroundColor = [UIColor clearColor];
    emailTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    emailTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //Sign Up Button
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signUpButton addTarget:self action:@selector(signUp:) forControlEvents: UIControlEventTouchUpInside];
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    signUpButton.frame = CGRectMake(halfWidth -113, halfLength + 200, 226, 44);
    signUpButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signUpButton setTitleColor:loginColor forState:UIControlStateNormal];
    [signUpButton setBackgroundColor:[UIColor clearColor]];
    [[signUpButton layer] setBorderWidth:1.0f];
    [[signUpButton layer] setBorderColor:loginColor.CGColor];
    signUpButton.layer.cornerRadius = 10;
    signUpButton.clipsToBounds = YES;
    
    //Back Button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton addTarget:self action:@selector(backToLogin:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"cancelButton.png"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(30, 48, 30, 30);
    
    //custom view color
    [_customView setBackgroundColor:[UIColor clearColor]];
    [_customView addSubview: usernameLine];
    [_customView addSubview: PWLine];
    [_customView addSubview: usernameIcon];
    [_customView addSubview: PWIcon];
    [_customView addSubview: usernameTextField];
    [_customView addSubview: PWTextField];
    [_customView addSubview: signUpButton];
    [_customView addSubview: PWConfirmLine];
    [_customView addSubview: PWConfirmIcon];
    [_customView addSubview: PWConfirmTextField];
    [_customView addSubview: emailIcon];
    [_customView addSubview: emailLine];
    [_customView addSubview: emailTextField];
    [_customView addSubview: backButton];
    [self.view sendSubviewToBack:signUpButton];
    
    //show hide keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    

    

}

- (void) backToLogin:(UIButton*)sender{
    [self performSegueWithIdentifier:@"backToLoginFromSignupNow" sender:nil];
    
}

    //sign up method
- (void)signUp:(UIButton*)sender{
    //NSLog(@"signup");
    
    
    if ([usernameTextField.text isEqualToString:@""] || [PWTextField.text isEqualToString:@""] || [PWConfirmTextField.text isEqualToString:@""] || [emailTextField.text isEqualToString:@""]) {
        UIAlertView *signupPopup = [[UIAlertView alloc] initWithTitle:@"Opps..." message:@"r u fucking kidding me?" delegate:self cancelButtonTitle:@"FINE" otherButtonTitles:nil];
        [signupPopup show];
    }
    else if (![PWTextField.text isEqualToString:PWConfirmTextField.text]){
        UIAlertView *signupPopup1 = [[UIAlertView alloc] initWithTitle:@"Opps..." message:@"NFM your PW doesnt match" delegate:self cancelButtonTitle:@"FINE" otherButtonTitles:nil];
        [signupPopup1 show];
    }
    
    else{
        PFUser *user = [PFUser user];
        user.username = usernameTextField.text;
        user.password = PWTextField.text;
        user.email = emailTextField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if(!error){
                //segue to ...
                
            }
            else{
                UIAlertView *signupPopup1 = [[UIAlertView alloc] initWithTitle:@"Opps..." message:[error userInfo][@"error"] delegate:self cancelButtonTitle:@"FINE" otherButtonTitles:nil];
                [signupPopup1 show];

            }
        }];
    }
    
}

    //keyboard show and move frame upward
- (void)keyboardWillShown:(NSNotification*)aNotification {
    if (!keyboardListener) {
        keyboardListener = YES;
        //        NSLog(@"show");
        [UIView animateWithDuration:0.5f animations:^{
            _customView.frame = CGRectOffset(_customView.frame, 0, -150);
        }];
    }
}

    //keyboard hide and move frame downward
- (void)keyboardWillHidden:(NSNotification*)aNotification {
    if (keyboardListener) {
        keyboardListener = NO;
        //        NSLog(@"hide");
        [UIView animateWithDuration:0.5f animations:^{
            _customView.frame = CGRectOffset(_customView.frame, 0, 150);
        }];
    }
}

    //touch dismiss keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

    //hex color
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
