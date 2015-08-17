//
//  SignUpSlideShowViewController.m
//  US
//
//  Created by NingFangming on 8/9/15.
//
//

#import "SignUpSlideShowViewController.h"
#import "SlideShowContentController.h"
#import "USColor.h"

@interface SignUpSlideShowViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSArray *contentImage;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@end

@implementation SignUpSlideShowViewController
@synthesize contentImage;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self createPageViewController];
    [self setupPageControl];
    
    
    
    //Sign Up Button
    signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signUpButton addTarget:self action:@selector(signUp:) forControlEvents: UIControlEventTouchUpInside];
    [signUpButton setTitle:@"Sign Up Now" forState:UIControlStateNormal];
    signUpButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 -113, [UIScreen mainScreen].bounds.size.height -100, 226, 44);
    signUpButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signUpButton setTitleColor:[USColor loginColor] forState:UIControlStateNormal];
    [signUpButton setBackgroundColor:[UIColor clearColor]];
    [[signUpButton layer] setBorderWidth:1.0f];
    [[signUpButton layer] setBorderColor:((UIColor *) [USColor loginColor]).CGColor];
    signUpButton.layer.cornerRadius = 10;
    signUpButton.clipsToBounds = YES;
    
    //Back Button
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton addTarget:self action:@selector(backToLogin:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"cancelButton.png"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(30, 48, 30, 30);

    //add button to view
    [self.view addSubview: signUpButton];
    [self.view sendSubviewToBack:signUpButton];
    [self.view addSubview:backButton];
    
}

    //back to login page segue
- (void) backToLogin:(UIButton*)sender{
    [self performSegueWithIdentifier:@"backToLogin" sender:nil];

}

    //slide show to signup page segue
- (void) signUp:(UIButton*)sender{
    [self performSegueWithIdentifier:@"SlideShowToSignup" sender:nil];
}

    //slide view
- (void) createPageViewController{
    contentImage = @[@"signupIntroduction1.png",
                      @"signupIntroduction2.png",
                      @"signupIntroduction3.png"];
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupSlideShow"];
    pageController.dataSource = self;
    pageController.delegate = self;
    
    if([contentImage count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex: 0]];
        [pageController setViewControllers: startingViewControllers
                                 direction: UIPageViewControllerNavigationDirectionForward
                                  animated: NO
                                completion: nil];
    }
    self.pageViewController = pageController;
    [self addChildViewController: self.pageViewController];
    [self.view addSubview: self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController: self];
}

    //dot dot dot
- (void) setupPageControl
{
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 -40,
                                                                  [UIScreen mainScreen].bounds.size.height -20, 80, 20)];
    pageControl.numberOfPages = [contentImage count];
    pageControl.currentPage = 0;
    pageControl.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pageControl];
    
}


-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
}

    //detect the action of flipping page
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (finished || completed) {
        SlideShowContentController *viewController = [self.pageViewController.viewControllers lastObject];
        pageControl.currentPage = viewController.itemIndex;
        if (viewController.itemIndex == [contentImage count] -1) {
            [self.view bringSubviewToFront:signUpButton];
        }
        else {
            [self.view sendSubviewToBack:signUpButton];
        }
    }
}

    // backward page
- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(UIViewController *) viewController
{
    SlideShowContentController *itemController = (SlideShowContentController *) viewController;
    
    if (itemController.itemIndex > 0)
    {
        temp =itemController.itemIndex-1;
        return [self itemControllerForIndex: itemController.itemIndex-1];
    }
    
    return nil;
}

    // forward page
- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(UIViewController *) viewController
{
    SlideShowContentController *itemController = (SlideShowContentController *) viewController;
    
    if (itemController.itemIndex+1 < [contentImage count])
    {
        temp =itemController.itemIndex+1;
        return [self itemControllerForIndex: itemController.itemIndex+1];
    }
    
    return nil;
}

    //next image
- (SlideShowContentController *) itemControllerForIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [contentImage count])
    {
        SlideShowContentController *contentView = [self.storyboard instantiateViewControllerWithIdentifier:@"slideShowContent"];
        contentView.itemIndex=itemIndex;
        contentView.imageName = contentImage[itemIndex];
        return contentView;
    }
    
    return nil;
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

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
    return [contentImage count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
    return 0;
}




@end
