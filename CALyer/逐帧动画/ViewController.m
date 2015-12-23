//
//  ViewController.m
//  逐帧动画
//
//  Created by 任玉飞 on 15/12/22.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#define IMAGE_COUNT 10
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@property(nonatomic, assign) int index;
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"鱼缸.jpg"].CGImage;
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 20, 20);
    _layer.position = CGPointMake(160, 284);
    [self.view.layer addSublayer:_layer];
    
    _images = [NSMutableArray array];
    for (int i = 0; i < IMAGE_COUNT; i++) {
        
    }
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(setp)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

@end
