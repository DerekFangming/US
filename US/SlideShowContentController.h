//
//  SlideShowContentController.h
//  US
//
//  Created by NingFangming on 8/9/15.
//
//

#import <UIKit/UIKit.h>

@interface SlideShowContentController : UIViewController

@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, strong) UIImageView *contentImageView;

@end
