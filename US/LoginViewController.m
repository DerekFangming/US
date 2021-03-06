//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "LoginViewController.h"

#import <Parse/Parse.h>

#import <QuartzCore/QuartzCore.h>

#import "SignUpSlideShowViewController.h"

#import "MainTabBarController.h"

#import "TimerTabBarViewController.h"

#import "AccountTabBarViewController.h"

#import "StoryTabBarViewController.h"

#import "USColor.h"

@implementation LoginViewController

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
    UIColor *loginColor = [USColor loginColor];
    
    
    //login logo
    UILabel *loginLogo = [[UILabel alloc] initWithFrame:CGRectMake(halfWidth - 42, halfLength - 133, 84, 74)];
    loginLogo.textColor = [USColor usColor];
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
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength - 10, 190, 30)];
    usernameTextField.textColor = [UIColor whiteColor];
    usernameTextField.backgroundColor = [UIColor clearColor];
    UIColor *placeholderColor = [USColor placeholderColor];
    usernameTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    usernameTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameTextField.text=@"l";
    
    //PW Textfield
    PWTextField = [[UITextField alloc] initWithFrame:CGRectMake(halfWidth -75, halfLength + 60, 190, 30)];
    PWTextField.textColor = [UIColor whiteColor];
    PWTextField.backgroundColor = [UIColor clearColor];
    PWTextField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    PWTextField.font = [UIFont fontWithName:@"Helvetica" size:20];
    PWTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PWTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    PWTextField.text=@"l";
    
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
    [self.view sendSubviewToBack:signUpButton];

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
    //NSLog(@"signin");
    [PFUser logInWithUsernameInBackground:usernameTextField.text password:PWTextField.text block:^(PFUser *user, NSError *error){
        if (user) {
            [self performSegueWithIdentifier:@"loginToHomePage" sender:nil];
        }
        else{
            UIAlertView *signupPopup = [[UIAlertView alloc] initWithTitle:@"Opps..." message:[error userInfo][@"error"] delegate:self cancelButtonTitle:@"FINE" otherButtonTitles:nil];
            [signupPopup show];

        }
    }];
}

    //sign up method
- (void)signUp:(UIButton*)sender{
    //NSLog(@"signup");
    [self performSegueWithIdentifier:@"signupSlideShowSegue" sender:nil];

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


    //Tab Setup
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    if ([[segue identifier] isEqualToString:@"loginToHomePage"]) {
        
        PFQuery *query = [PFQuery queryWithClassName:@"_User"];
        [query whereKey:@"objectId" equalTo:[PFUser currentUser].objectId];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
//                NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
//                [formatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];

                tempDate = objects[0][@"timerDate"];
                
                MainTabBarController *dest = (MainTabBarController *) [segue destinationViewController];
                StoryTabBarViewController *story = (StoryTabBarViewController *) [dest.viewControllers objectAtIndex:0];
                story.tabBarItem.image = [UIImage imageNamed:@"storyTabImg@2x.png"];
                TimerTabBarViewController *timer = (TimerTabBarViewController *) [dest.viewControllers objectAtIndex:1];
                
                if (tempDate != nil) {
                    timer.startedDate = tempDate;
                }
                
                timer.tabBarItem.image = [UIImage imageNamed:@"timerTabImg@2x.png"];
                AccountTabBarViewController *account = (AccountTabBarViewController *) [dest.viewControllers objectAtIndex:2];
                account.tabBarItem.image = [UIImage imageNamed:@"accountTabImg@2x.png"];
                dest.tabBar.tintColor = [USColor usColor];
                
//                NSLog(@"%@",[formatter stringFromDate:  tempDate]) ;
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
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
