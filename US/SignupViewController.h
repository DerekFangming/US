//
//  SignupViewController.h
//  US
//
//  Created by NingFangming on 8/11/15.
//
//

#import <UIKit/UIKit.h>


@interface SignupViewController : UIViewController{
    int keyboardListener;
    UITextField *usernameTextField;
    UITextField *PWTextField;
    UITextField *PWConfirmTextField;
    UITextField *emailTextField;
}
@property (weak, nonatomic) IBOutlet UIView *customView;

@end
