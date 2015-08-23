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
    
    //background image
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"timerBG.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //define screen width & length
    CGFloat halfWidth = [UIScreen mainScreen].bounds.size.width/2; //Half Width
    CGFloat halfLength = [UIScreen mainScreen].bounds.size.height/2; //Half Heigh
    
    //add circular
    self.progressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(15.0f, halfLength-225, halfWidth*2-30, halfWidth*2-30)];
    self.progressView.roundedCorners = NO;
//    self.progressView.trackTintColor = [UIColor whiteColor];
    self.progressView.progressTintColor = [USColor usColor];
    [self.progressView setThicknessRatio:0.12f];
    
    
    
    
    
    
    
    if (_startedDate == nil) {
        //timer submit button
        _timerSubmitButton.backgroundColor = [USColor usColor];
        [[_timerSubmitButton imageView] setContentMode:UIViewContentModeScaleAspectFit];
        _timerSubmitButton.layer.cornerRadius = _timerSubmitButton.bounds.size.width/2;
        [_timerSubmitButton addTarget:self action:@selector(timerSubmit:) forControlEvents: UIControlEventTouchUpInside];
    }
    else{
        _timerDatePicker.hidden = YES;
        _timerSubmitButton.hidden = YES;
        _timeSelectedLable.hidden = YES;
        
        //create counter lable
        timerCounterLable = [[UILabel alloc] initWithFrame:CGRectMake(0, halfLength-150, halfWidth*2, 150)];
        timerCounterLable.textColor = [USColor usColor];
        timerCounterLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:80];
        timerCounterLable.textAlignment = NSTextAlignmentCenter;
        timerCounterLable.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:self.progressView];
        [self calCircularStep];
        
        [self.view addSubview:timerCounterLable];
        
        [self calDate];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(calCircularStep) name:@"calCircularStep" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeProgress) name:@"removeProgress" object:nil];
    
}

    //upload database


    //timer submit button method
- (void)timerSubmit:(UIButton*)sender{
    PFUser *currentUser = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"objectId" equalTo:currentUser.objectId];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error){
        if (!error) {
            _startedDate = [_timerDatePicker date];
            [userInfo setObject:_startedDate forKey:@"timerDate"];
            [userInfo saveInBackground];
            _timerDatePicker.hidden = YES;
            _timerSubmitButton.hidden = YES;
            _timeSelectedLable.hidden = YES;
            
            //define screen width & length
            CGFloat halfWidth = [UIScreen mainScreen].bounds.size.width/2; //Half Width
            CGFloat halfLength = [UIScreen mainScreen].bounds.size.height/2; //Half Heigh
            
            //create counter lable
            timerCounterLable = [[UILabel alloc] initWithFrame:CGRectMake(0, halfLength-150, halfWidth*2, 150)];
            timerCounterLable.textColor = [USColor usColor];
            timerCounterLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:80];
            timerCounterLable.textAlignment = NSTextAlignmentCenter;
            timerCounterLable.backgroundColor = [UIColor clearColor];
            
            [self.view addSubview:self.progressView];
            [self calCircularStep];
            
            [self.view addSubview:timerCounterLable];
            
            [self calDate];
            
            
        }
        else{
            NSLog(@"Error: %@", error);
        }
    }];
}

    //calculate date
- (void)calDate {
    NSTimeInterval secondBetween = [_startedDate timeIntervalSinceNow];
    int numberOfDays = -secondBetween / 86400;
    timerCounterLable.text = [@(numberOfDays) stringValue];
}

    
- (void)progressChange{
    NSLog(@"runed");
    CGFloat progress = self.progressView.progress + 0.0025f;
    [self.progressView setProgress:progress animated:YES];
    if (self.progressView.progress >= 1.0f) {
        NSLog(@"33");
        [self.progressView setProgress:0.f animated:YES];
        [self calDate];
    }
    
}
// test


- (void)calCircularStep{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *currentDateFormatter = [[NSDateFormatter alloc] init];
    [currentDateFormatter setDateFormat:@"hh"];
    NSString *currentTimeString = [currentDateFormatter stringFromDate:currentDate];
    double currentTimeDouble = [currentTimeString doubleValue];
    [currentDateFormatter setDateFormat:@"mm"];
    currentTimeString = [currentDateFormatter stringFromDate:currentDate];
    //go to current time
    currentTimeDouble += [currentTimeString doubleValue]/60;
    currentTimeDouble = currentTimeDouble/24;
    //   NSLog(@"step is %g", currentTimeDouble);
    [self.progressView setProgress:currentTimeDouble animated:YES initialDelay:0 withDuration:3];
    
    //start animation
    startAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:216
                                                                    target:self
                                                                  selector:@selector(progressChange)
                                                                  userInfo:nil
                                                                   repeats:YES];
    

}

-(void)removeProgress{
    [self.progressView setProgress:0.f animated:NO];
    [startAnimationTimer invalidate];
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
