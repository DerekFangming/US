//
//  MainTabBarController.m
//  US
//
//  Created by NingFangming on 8/14/15.
//
//

#import "MainTabBarController.h"

#import "TimerTabBarViewController.h"

#import "USColor.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (self.tabBarController.selectedIndex == 1) {
        NSLog(@"33");
    }
    
    //[[UITabBar appearance] tintColor:[USColor usColor]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:@"Timer"]) {
        NSLog(@"tab selected: %@", item.title);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"calCircularStep" object:nil];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeProgress" object:nil];

    }
   
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
