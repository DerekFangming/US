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
    
    //full size view
    _imageView.contentMode = UIViewContentModeScaleToFill;
    _imageView.image = [UIImage imageNamed: _imageName];
}

    //chang image
- (void) setImageName:(NSString *)imageName{
    _imageName=imageName;
    _imageView.image = [UIImage imageNamed: _imageName];
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
