//
//  ViewController.m
//  弹性动画
//
//  Created by 任玉飞 on 15/12/23.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "ViewController.h"
#import "UIView+RYF.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鱼.jpg"]];
    _imageView.center = CGPointMake(160, 150);
    _imageView.size = CGSizeMake(100, 100);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = point;
    } completion:^(BOOL finished) {
        
    }];
}
@end
