//
//  SlideShowContentController.m
//  US
//
//  Created by NingFangming on 8/9/15.
//
//

#import "SlideShowContentController.h"

@interface SlideShowContentController ()

@end

@implementation SlideShowContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _contentImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _contentImageView.contentMode = UIViewContentModeScaleToFill;
    _contentImageView.image = [UIImage imageNamed: _imageName];
}

- (void) setImageName:(NSString *)imageName{
    _imageName=imageName;
    _contentImageView.image = [UIImage imageNamed: _imageName];
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
