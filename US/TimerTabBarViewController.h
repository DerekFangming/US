//
//  TimerTabBarViewController.h
//  US
//
//  Created by NingFangming on 8/14/15.
//
//

#import <UIKit/UIKit.h>

#import "DACircularProgressView.h"


@interface TimerTabBarViewController : UIViewController{
    UILabel *timerCounterLable;
    NSTimer *startAnimationTimer;
}

@property (strong) NSDate *startedDate;

@property (weak, nonatomic) IBOutlet UIDatePicker *timerDatePicker;

@property (weak, nonatomic) IBOutlet UIButton *timerSubmitButton;

@property (weak, nonatomic) IBOutlet UILabel *timeSelectedLable;

@property (strong, nonatomic) DACircularProgressView *progressView;


@end
