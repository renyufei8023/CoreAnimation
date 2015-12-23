//
//  ViewController.m
//  关键帧动画
//
//  Created by 任玉飞 on 15/12/23.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"鱼缸.jpg"]];
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"鱼.jpg"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    [self setupAnimation];
}


- (void)setupAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);
    keyAnimation.path = path;
    CGPathRelease(path);
//    
//    NSValue *value1 = [NSValue valueWithCGPoint:_layer.position];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(80, 220)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(45, 300)];
//    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(55, 400)];
//    NSArray *values = @[value1,value2,value3,value4];
    
    
    keyAnimation.duration = 6.0f;
    keyAnimation.beginTime = CACurrentMediaTime() + 2;
//    keyAnimation.values = values;
    [_layer addAnimation:keyAnimation forKey:@"ryfanimation"];
}


@end
