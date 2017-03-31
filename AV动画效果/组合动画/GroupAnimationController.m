//
//  GroupAnimationController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/31.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GroupAnimationController.h"

@interface GroupAnimationController ()
@property (nonatomic, strong,) UIView *demoView;

@end

@implementation GroupAnimationController

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
            // 同时
            [self groupAnimation1];
            break;
        case 1:
            // 连续
            [self groupAnimation2];
            break;
        default:
            break;
    }
}
// 同时
- (void)groupAnimation1 {
    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *a = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *b = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *c = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *d = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *e = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *f = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    
    anima1.values = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];
    
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:1];
    anima2.toValue = [NSNumber numberWithFloat:2.0];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    //动画组
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    groupAnima.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
    groupAnima.duration = 4;
    
    [_demoView.layer addAnimation:groupAnima forKey:@"groupAnimation"];
    // 其实就算不放入组动画的集合中只要是一个一个的添加到layer也有组动画的效果
}

// 连续
- (void)groupAnimation2 {
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    //位移动画
    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-75)];
    anima1.beginTime = currentTime;
    anima1.duration = 2;
    anima1.fillMode = kCAFillModeForwards;
    anima1.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima1 forKey:@"a"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8];
    anima2.toValue = [NSNumber numberWithFloat:2];
    anima2.beginTime = currentTime+2;
    anima2.duration = 2;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima2 forKey:@"b"];
    
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+2;
    anima3.duration = 2;
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima3 forKey:@"c"];
    
    
}


















- (NSString *)controllerTitle {
    return @"组合动画";
}

- (NSArray *)btnTitleArray {
    return [NSArray arrayWithObjects:@"同时动画",@"连续动画", nil];
}


@end
