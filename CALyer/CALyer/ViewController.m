//
//  ViewController.m
//  CALyer
//
//  Created by 任玉飞 on 15/12/22.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#define PHOTO_HEIGHT 150
#define KSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#import "ViewController.h"
#import "RYFView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RYFView *view=[[RYFView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    [self.view addSubview:view];
    
//    CGPoint postion =CGPointMake(KSCREEN_WIDTH/2, PHOTO_HEIGHT);
//    CGRect bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
////    CGFloat cornerRadius=PHOTO_HEIGHT/2;
//    CGFloat borderWidth=2;
//    
//    //阴影图层
//    CALayer *layerShadow = [CALayer layer];
//    layerShadow.bounds = bounds;
//    layerShadow.position = postion;
//    layerShadow.cornerRadius = PHOTO_HEIGHT/2;
//    layerShadow.shadowColor = [UIColor grayColor].CGColor;
//    layerShadow.shadowOffset = CGSizeMake(3, 1);
//    layerShadow.shadowOpacity = 1.0f;
//    layerShadow.borderWidth = borderWidth;
//    layerShadow.borderColor = [UIColor whiteColor].CGColor;
//    [self.view.layer addSublayer:layerShadow];
//    
//    CALayer *layer = [CALayer layer];
//    
//    layer.bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
//    layer.position = CGPointMake(KSCREEN_WIDTH/2, PHOTO_HEIGHT);
////    layer.backgroundColor = [UIColor redColor].CGColor;
//    layer.cornerRadius = PHOTO_HEIGHT/2;
//    layer.masksToBounds = YES;
//    layer.borderColor = [UIColor blackColor].CGColor;
//    layer.borderWidth = 3;
//    layer.delegate = self;
//    //利用图层形变解决图像倒立问题
////    layer.transform = CATransform3DMakeRotation(M_PI, 200, 0, 0);
//    [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
////    layer.contents = (__bridge id _Nullable)[UIImage imageNamed:@"placeholder"].CGImage;
//    [self.view.layer addSublayer:layer];
//    [layer setNeedsDisplay];//必须调用，不然代理方法无法调用,如果之前设置了layer的contens再去调用这个方法那么之前的contents就没了
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);//保存之前定义的图层
    
    //图形上下文形变，解决图片倒立的问题
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);
    CGContextRestoreGState(ctx);//清除
    
}

@end
