//
//  ViewController.m
//  UIView动画封装
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

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"鱼缸.jpg"]];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鱼.jpg"]];
    _imageView.size = CGSizeMake(30, 30);
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
//    [UIView animateWithDuration:5.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        _imageView.center = point;
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [UIView beginAnimations:@"ryfanimation" context:nil];
    [UIView setAnimationDuration:5.0];
    [UIView setAnimationDelay:1.0];//设置延迟
    //[UIView setAnimationRepeatAutoreverses:NO];//是否回复
    [UIView setAnimationRepeatCount:10];//重复次数
//    [UIView setAnimationStartDate:<#(nonnull NSDate *)#>];//设置动画开始运行事件
    [UIView setAnimationDelegate:self];
//    [UIView setAnimationWillStartSelector:@selector(<#selector#>)];//设置动画开始运动的执行方法
//    [UIView setAnimationDidStopSelector:<#(nullable SEL)#>];//设置动画运行结束后执行的方法
    
    _imageView.center = point;
    [UIView commitAnimations];
}
@end
