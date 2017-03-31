//
//  ViewController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/30.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.demoView = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 50, 50)];
    self.demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.demoView];
    
    
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 500, 120, 30)];
    self.btn.backgroundColor = [UIColor yellowColor];
    [self.btn setTitle:@"测试" forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.btn];
    
    
    
    
}
//位移
- (void)btnClick {
    [self groupAnimation];
    
}

//透明度 背景色  需要注意的是传值 CGColor keyPath: backgroundColor
//缩放 ： transform.scale NSNumber
//旋转 ： transform.roration.z 决定你怎么旋转
- (void)animation2 {
    //基础动画类 固定了的 基础动画都是基于点来实现 不关注动画实现过程中的路径问题
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    //需要给2个点  起点到终点花了多少时间
    anima.fromValue = [NSNumber numberWithFloat:1];
    anima.toValue = [NSNumber numberWithFloat:0.2];
    anima.duration = 1;
    //动画执行完之后，demoview需要停在哪里
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO ;
    
    [self.demoView.layer addAnimation:anima forKey:@"opacity"];
    
    
}

//位移
- (void)animation {
    //基础动画类 固定了的 基础动画都是基于点来实现 不关注动画实现过程中的路径问题
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //需要给2个点  起点到终点花了多少时间
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(10, 200)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(360, 200)];
    anima.duration = 3;
    //动画执行完之后，demoview需要停在哪里
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO ;
    
    [self.demoView.layer addAnimation:anima forKey:@"position"];
    
    
}


//关键帧动画的话：   基础动画是关键帧动画的一个特例
- (void)keyAnimation {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *a = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *b = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *c = [NSValue valueWithCGPoint:CGPointMake(200, 300)];

    anima.values = [NSArray arrayWithObjects:a,b,c, nil];
    //运行的时间
    anima.duration = 4;
    //设置动画的节奏
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //动画执行完之后，demoview需要停在哪里
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO ;
    
    [self.demoView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    
    //直播最底层的框架是什么？FFmpeg
    
}

//贝塞尔曲线  
- (void)keyAnimation1 {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 300, 300)];
    
    anima.path = path.CGPath;

    
    //运行的时间
    anima.duration = 4;
    //设置动画的节奏
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    
    [self.demoView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    
}

//抖动（需要旋转x，再旋转回来） transform.rotation.z
- (void)keyAnimation2 {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 300, 300)];
    
    anima.path = path.CGPath;
    
    
    //抖动中  抖动的次数
    anima.duration = 10;
    //动画执行的次数
    anima.repeatCount = 100;
    //设置动画的节奏
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    [self.demoView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    
}



- (void)groupAnimation {
    //位移
    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //需要给2个点  起点到终点花了多少时间
    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(10, 200)];
    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(360, 200)];
    
    
    
    //关键帧
    CAKeyframeAnimation *anima2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *a = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *b = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *c = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    anima2.values = [NSArray arrayWithObjects:a,b,c, nil];
    //设置动画的节奏
    anima2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    


    /*---------------------*/
    
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    groupAnima.animations = [NSArray arrayWithObjects:anima1,anima2, nil];
    //运行的时间
    groupAnima.duration = 4;

    //动画执行完之后，demoview需要停在哪里
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO ;
    
    //forKey 可以随便给
    [self.demoView.layer addAnimation:groupAnima forKey:@"groupAnima"];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
