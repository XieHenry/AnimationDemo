//
//  KeyFrameViewController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/31.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()
@property (nonatomic, strong) UIView *demoView;

@end

@implementation KeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50,50,50)];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
}


- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            //关键帧动画
            [self KeyFrameAnimation];
            break;
        case 1:
            //路径
            [self pathAnimation];
            break;
        case 2:
            //抖动
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

//关键帧动画
- (void)KeyFrameAnimation {
    //CABasicAnimation算是CAKeyFrameAnimation的 特殊情况，即不考虑中间变换过程，只考虑起始点与目标点就可以了。而CAKeyFrameAnimation则更复杂一些，允许我们在起点与终点自定义 更多内容来达到我们的实际应用需求，所以在使用关键帧的动画的时候，我们需要给它一个关键帧的路径。
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    anima.values 关键帧路径数组
    NSValue *a = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *b = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *c = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *d = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *e = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *f = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    
    anima.values = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];
    anima.duration = 4;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [_demoView.layer addAnimation:anima forKey:@"KeyFrameAnimation"];
}


//路径
- (void)pathAnimation {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 4;
    [_demoView.layer addAnimation:anima forKey:@"pathAnimation"];

}


//抖动
- (void)shakeAnimation {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
    NSValue *a = [NSNumber numberWithFloat:-M_PI/180*36];
    NSValue *b = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *c = [NSNumber numberWithFloat:-M_PI/180*36];
    anima.values = @[a,b,c];
    anima.repeatCount = 10;
    
    [_demoView.layer addAnimation:anima forKey:@"shakeAnimation"];

}


- (NSArray *)btnTitleArray {
    return [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
}

- (NSString *)controllerTitle {
    return @"关键帧动画";
}
@end
