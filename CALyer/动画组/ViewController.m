//
//  ViewController.m
//  动画组
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
    
    [self groupAnimation];
}

- (void)groupAnimation
{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
//    groupAnimation.duration = 10.0f;
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.delegate = self;
    CGFloat toValue = M_PI_2 * 3;
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2*3];
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"KCBasicAnimationProperty_ToValue"];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint endPoint = CGPointMake(55, 500);
    keyAnimation.delegate = self;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, endPoint.x, endPoint.y);
    keyAnimation.path = path;
    [keyAnimation setValue:[NSValue valueWithCGPoint:endPoint] forKey:@"KCKeyframeAnimationProperty_EndPosition"];
    
    groupAnimation.animations = @[basicAnimation,keyAnimation];
    
    groupAnimation.duration = 10.0;
//    groupAnimation.beginTime = CACurrentMediaTime() + 3;
//    groupAnimation.delegate = self;
    [groupAnimation setDelegate:self];
    [_layer addAnimation:groupAnimation forKey:nil];
    
//    [_layer setNeedsDisplay];
    
}

- (void)animationDidStart:(CAAnimation *)anim
{
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CAAnimationGroup *groupAnimation = (CAAnimationGroup*)anim;
    CABasicAnimation *basicAnimation=groupAnimation.animations[0];
    CAKeyframeAnimation *keyframeAnimation=groupAnimation.animations[1];
    CGFloat toValue=[[basicAnimation valueForKey:@"KCBasicAnimationProperty_ToValue"] floatValue];
    CGPoint endPoint=[[keyframeAnimation valueForKey:@"KCKeyframeAnimationProperty_EndPosition"] CGPointValue];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    _layer.position = endPoint;
    _layer.transform = CATransform3DMakeRotation(toValue, 0, 0, 1);
    
    [CATransaction commit];
}
@end
