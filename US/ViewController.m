//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "ViewController.h"

#import <Parse/Parse.h>

#import <QuartzCore/QuartzCore.h>

@implementation ViewController

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
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

    //login logo
    UILabel *loginLogo = [[UILabel alloc] initWithFrame:CGRectMake(halfWidth - 42, halfLength - 133, 84, 74)];
    loginLogo.textColor = [self colorWithHexString:@"ffffff"];
    loginLogo.font = [UIFont fontWithName:@"Helvetica-Bold" size:60];
    loginLogo.textAlignment = NSTextAlignmentCenter;
    loginLogo.backgroundColor = [UIColor clearColor];
    loginLogo.text = @"US";
    
    //LOGIN Username Line
    UIImageView *usernameLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength +30, 226, 1)];
    usernameLine.image=[UIImage imageNamed:@"loginLine.png"];
    usernameLine.contentMode = UIViewContentModeScaleToFill;
    
    //PW Line
    UIImageView *PWLine = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength + 100, 226, 1)];
    PWLine.image=[UIImage imageNamed:@"loginLine.png"];
    PWLine.contentMode = UIViewContentModeScaleToFill;
    
    //Username Icon
    UIImageView *usernameIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength - 13, 30, 30)];
    usernameIcon.image=[UIImage imageNamed:@"loginUsernameIcon.png"];
    usernameIcon.contentMode = UIViewContentModeScaleToFill;

    //PW Icon
    UIImageView *PWIcon = [[UIImageView alloc] initWithFrame:CGRectMake(halfWidth -113, halfLength +57, 30, 30)];
    PWIcon.image=[UIImage imageNamed:@"loginPWIcon.png"];
    PWIcon.contentMode = UIViewContentModeScaleToFill;
    
    //Username Textfield
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength - 10, 190, 30)];
    usernameTextField.textColor = [UIColor whiteColor];
    usernameTextField.backgroundColor = [UIColor clearColor];
    UIColor *placeholderColor = [self colorWithHexString:@"1E1E1E"];
    usernameTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    usernameTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    //PW Textfield
    UITextField *PWTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength + 60, 190, 30)];
    PWTextField.textColor = [UIColor whiteColor];
    PWTextField.backgroundColor = [UIColor clearColor];
    PWTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    PWTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    //Sign In Button
    UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signInButton addTarget:self action:@selector(signIn:) forControlEvents: UIControlEventTouchUpInside];
    [signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
    signInButton.frame = CGRectMake(halfWidth -113, halfLength + 143, 226, 44);
    signInButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signInButton setTitleColor:loginColor forState:UIControlStateNormal];
    [signInButton setBackgroundColor:[UIColor clearColor]];
    [[signInButton layer] setBorderWidth:1.0f];
    [[signInButton layer] setBorderColor:loginColor.CGColor];
    signInButton.layer.cornerRadius = 10;
    signInButton.clipsToBounds = YES;
    
    //Sign Up Button
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signUpButton addTarget:self action:@selector(signIn:) forControlEvents: UIControlEventTouchUpInside];
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    signUpButton.frame = CGRectMake(halfWidth -113, halfLength + 200, 226, 44);
    signUpButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signUpButton setTitleColor:loginColor forState:UIControlStateNormal];
    [signUpButton setBackgroundColor:[UIColor clearColor]];
    [[signUpButton layer] setBorderWidth:1.0f];
    [[signUpButton layer] setBorderColor:loginColor.CGColor];
    signUpButton.layer.cornerRadius = 10;
    signUpButton.clipsToBounds = YES;
    
    //custom view color
    [_customView setBackgroundColor:[UIColor clearColor]];
    [_customView addSubview: loginLogo];
    [_customView addSubview: usernameLine];
    [_customView addSubview: PWLine];
    [_customView addSubview: usernameIcon];
    [_customView addSubview: PWIcon];
    [_customView addSubview: usernameTextField];
    [_customView addSubview: PWTextField];
    [_customView addSubview: signInButton];
    [_customView addSubview: signUpButton];

    
    /*
    //login icon image
    _usernameIcon.image=[UIImage imageNamed:@"loginUsernameIcon.png"];
    _PWIcon.image=[UIImage imageNamed:@"loginPWIcon.png"];
    
    //login textfield
    [_usernameTextfield setBackgroundColor:[UIColor clearColor]];//transparent
    [_usernameTextfield setBorderStyle:UITextBorderStyleNone];//non-border
    [_usernameTextfield setTextColor:[UIColor whiteColor]];//text color:white
    [_PWTextfield setBackgroundColor:[UIColor clearColor]];
    [_PWTextfield setBorderStyle:UITextBorderStyleNone];
    [_PWTextfield setTextColor:[UIColor whiteColor]];
    
    //login line
    _loginLine1.image=[UIImage imageNamed:@"loginLine.png"];
    _loginLine2.image=[UIImage imageNamed:@"loginLine.png"];

    //login button color
    [_signInBotton setBackgroundColor:[self colorWithHexString:@"089DD8"]];
    [_signUpButton setBackgroundColor:[self colorWithHexString:@"089DD8"]];
    */
    
    
    
    //show hide keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    
    //database
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar123";
    //[testObject saveInBackground];
}

    //sign in method
- (void)signIn:(UIButton*)sender{
    NSLog(@"signin");
}

    //sign up method
- (void)signUp:(UIButton*)sender{
    NSLog(@"signup");
}

    //keyboard show and move frame upward
- (void)keyboardWillShown:(NSNotification*)aNotification {
    //NSLog(@"show");
    [UIView animateWithDuration:0.5f animations:^{
        _customView.frame = CGRectOffset(_customView.frame, 0, -150);

    }];
}

    //keyboard hide and move frame downward
- (void)keyboardWillHidden:(NSNotification*)aNotification {
    //NSLog(@"hide");
    [UIView animateWithDuration:0.5f animations:^{
        _customView.frame = CGRectOffset(_customView.frame, 0, 150);

        
    }];
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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
