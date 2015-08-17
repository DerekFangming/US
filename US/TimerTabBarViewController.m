//
//  TimerTabBarViewController.m
//  US
//
//  Created by NingFangming on 8/14/15.
//
//

#import "TimerTabBarViewController.h"

#import "USColor.h"

#import <Parse/Parse.h>

@interface TimerTabBarViewController ()

@end

@implementation TimerTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_timerDatePicker.hidden = YES;
    
//    _timerDatePicker.timeZone = [NSTimeZone systemTimeZone];
    [_timerDatePicker setTimeZone:[NSTimeZone localTimeZone]];
    
    //background image
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"timerBG.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    //timer submit button
    _timerSubmitButton.backgroundColor = [USColor usColor];
    [[_timerSubmitButton imageView] setContentMode:UIViewContentModeScaleAspectFit];
    //[_timerSubmitButton setImage:[UIImage imageNamed:@"whiteCheck@2x.png"] forState:UIControlStateNormal];
    _timerSubmitButton.layer.cornerRadius = _timerSubmitButton.bounds.size.width/2;
    [_timerSubmitButton addTarget:self action:@selector(timerSubmit:) forControlEvents: UIControlEventTouchUpInside];

}

    //upload database


    //timer submit button method
- (void)timerSubmit:(UIButton*)sender{
//    PFUser *currentUser = [PFUser currentUser];
//    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
//    [query whereKey:@"objectId" equalTo:currentUser.objectId];
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error){
//        if (!error) {
//            [userInfo setObject:[_timerDatePicker date] forKey:@"timerDate"];
//            [userInfo saveInBackground];
//        }
//        else{
//            NSLog(@"Error: %@", error);
//        }
//    }];
    NSLog(@"%@", [_timerDatePicker date]);
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
