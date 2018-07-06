//
//  CenterViewController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/31.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()
@property (nonatomic, strong) UIView *demoView;
/** 按钮 */
@property(nonatomic, strong) NSArray *btnTitleArray;
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100, 100, 100)];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
}


- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            // 位移动画  直播弹幕效果
            [self positionAnimation];
            break;
        case 1:
            // 透明度
            [self alphaAnimation];
            break;
        case 2:
            // 缩放
            [self scaleAnimation];
            break;
        case 3:
            // 旋转
            [self rotateAnimation];
            break;
        case 4:
            // 背景颜色
            [self backgroundColorAnimation];

            break;
        default:
            break;
    }
}


// 位移动画  直播弹幕效果
- (void)positionAnimation {
    //实现思路  1.frame 值改变加定时器 2.基础动画
    //CABasicAnimation创建基础动画
    //关于animationWithKeyPath的取值问题
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    //设置位移值
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    //位移的时间
    anima.duration = 4;
    
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//    anima.fillMode = kCAFillModeForwards;
//    anima.removedOnCompletion = NO;
    
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_demoView.layer addAnimation:anima forKey:@"position"];
    
}

// 透明度
- (void)alphaAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1];
    anima.toValue = [NSNumber numberWithFloat:0.2];
    anima.duration = 2;
    [_demoView.layer addAnimation:anima forKey:@"alphaAnimation"];
}


//缩放
- (void)scaleAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima.fromValue = [NSNumber numberWithFloat:1.0];
    anima.toValue = [NSNumber numberWithFloat:-1.2];
    anima.duration = 4.0;
    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
}

// 旋转
- (void)rotateAnimation {
    //绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.duration = 4;
    [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
}


// 背景颜色
- (void)backgroundColorAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue = (id)[UIColor greenColor].CGColor;
    anima.duration = 1.0;
    [_demoView.layer addAnimation:anima forKey:@"backgroundColorAnimation"];
}









// 按钮数组
- (NSArray *)btnTitleArray {
    return [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
}

//控制器名称显示
- (NSString *)controllerTitle {
    return @"基础动画";
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
