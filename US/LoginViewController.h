//
//  ParseStarterProjectViewController.h
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    int keyboardListener;
    UITextField *usernameTextField;
    UITextField *PWTextField;
    
}


@property (weak, nonatomic) IBOutlet UIView *customView;


@end
