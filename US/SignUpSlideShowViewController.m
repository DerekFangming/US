//
//  SignUpSlideShowViewController.m
//  US
//
//  Created by NingFangming on 8/9/15.
//
//

#import "SignUpSlideShowViewController.h"
#import "SlideShowContentController.h"


@interface SignUpSlideShowViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *contentImage;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@end

@implementation SignUpSlideShowViewController
@synthesize contentImage;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [super viewDidLoad];
    [self createPageViewController];
    [self setupPageControl];
    
}

- (void) createPageViewController{
    contentImage = @[@"loginPWIcon.png",
                      @"loginBg.png",
                      @"loginUsernameIcon.png"];
    
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageController.dataSource = self;
    
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


- (void) setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
    
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(SlideShowContentController *) viewController
{
    SlideShowContentController *itemController = (SlideShowContentController *) viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex: itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(SlideShowContentController *) viewController
{
    SlideShowContentController *itemController = (SlideShowContentController *) viewController;
    
    if (itemController.itemIndex+1 < [contentImage count])
    {
        return [self itemControllerForIndex: itemController.itemIndex+1];
    }
    
    return nil;
}

- (SlideShowContentController *) itemControllerForIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [contentImage count])
    {
        SlideShowContentController *contentView = [[SlideShowContentController alloc] init];
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
