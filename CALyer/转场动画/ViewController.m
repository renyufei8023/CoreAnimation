//
//  ViewController.m
//  转场动画
//
//  Created by 任玉飞 on 15/12/22.
//  Copyright © 2015年 任玉飞. All rights reserved.
//
#define IMAGE_COUNT 4
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property(nonatomic, assign) int currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _imageView = [[UIImageView alloc]init];
    _imageView.frame = [UIScreen mainScreen].bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"周杰伦1.jpg"];
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
}

- (void)leftSwipe:(UISwipeGestureRecognizer *)swipe
{
    [self transitionAnimation:YES];
}

- (void)rightSwipe:(UISwipeGestureRecognizer *)swipe
{
    [self transitionAnimation:NO];
}

- (void)transitionAnimation:(BOOL)isNext
{
    CATransition *trans = [CATransition animation];
    trans.type = @"cameralIrisHollowOpen";
    if (isNext) {
        trans.subtype = kCATransitionFromTop;
    }else{
        trans.subtype = kCATransitionFromBottom;
    }
    
    trans.duration = 1.0f;
    [_imageView.layer addAnimation:trans forKey:@"shabi"];
    _imageView.image = [self getImage:isNext];
}

- (UIImage *)getImage:(BOOL)isNext
{
    if (isNext) {
        _currentIndex = (_currentIndex+1)%IMAGE_COUNT;
    }else{
        _currentIndex = (_currentIndex+IMAGE_COUNT)%IMAGE_COUNT;
    }
    
    NSString *name = [NSString stringWithFormat:@"周杰伦%i.jpg",_currentIndex];
    return [UIImage imageNamed:name];
}
@end
