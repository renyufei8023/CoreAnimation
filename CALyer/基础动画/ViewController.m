//
//  ViewController.m
//  基础动画
//
//  Created by 任玉飞 on 15/12/22.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *bgImageView = [UIImage imageNamed:@"周杰伦"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImageView];
    
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(10, 20);
    _layer.contents = (__bridge id)[UIImage imageNamed:@"placeholder"].CGImage;
    [self.view.layer addSublayer:_layer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [self transFormAnimation:point];
}

- (void)transFormAnimation:(CGPoint)point
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue = [NSValue valueWithCGPoint:point];
//    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    basicAnimation.duration = 5.0;//持续时间
    basicAnimation.delegate = self;
    
    [_layer setValue:[NSValue valueWithCGPoint:point] forKey:@"KCBasicAnimationLocation"];
    //添加动画到图层，注意key相当于给动画进行命名，以后获得该动画时可以使用此名称获取
    [_layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Rotation"];
}

- (void)rotationAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"KCBasicAnimation_Translation"];
    animation.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    animation.duration = 6;
    animation.autoreverses = YES;//旋转后再旋转到原来的位置
    [_layer addAnimation:animation forKey:@"KCBasicAnimation_Translation"];
}
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animation%@ start frame%@",anim,NSStringFromCGRect(_layer.frame));
    NSLog(@"%@",[_layer animationForKey:@"KCBasicAnimation_Translation"]);//通过前面的设置的key获得动画
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //开启事务
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    NSLog(@"animation%@  frame%@",anim,NSStringFromCGRect(_layer.frame));
    _layer.position = [[anim valueForKey:@"KCBasicAnimation_Translation"]CGPointValue];
    //提交事务
    [CATransaction commit];
}
@end
