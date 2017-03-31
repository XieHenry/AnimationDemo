//
//  AffineTransformController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/31.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "AffineTransformController.h"

@interface AffineTransformController ()
@property (nonatomic, strong) UIView *demoView;

@end

@implementation AffineTransformController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50,50,50)];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
}


-(void)clickBtn : (UIButton *)btn{
    CGAffineTransform transform;
    CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
    CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
    switch (btn.tag) {
        case 0:
            transform = CGAffineTransformMakeTranslation(100, 100);
            [self affineTransformAnimation:transform];
            break;
        case 1:
            transform = CGAffineTransformMakeScale(4,4);
            [self affineTransformAnimation:transform];
            break;
        case 2:
            transform = CGAffineTransformMakeRotation(M_PI);
            [self affineTransformAnimation:transform];
            break;
        case 3:
            transform = CGAffineTransformTranslate(transform2, 100, 100);
            [self affineTransformAnimation:transform];
            break;
        case 4:
            transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
            [self affineTransformAnimation:transform];
            break;
        default:
            break;
    }
}


//仿射变换 @param transform transform
-(void)affineTransformAnimation:(CGAffineTransform)transform {
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        _demoView.transform = transform;
    }];
}


- (NSString *)controllerTitle {
    return @"仿射变换";
}

- (NSArray *)btnTitleArray {
    return [NSArray arrayWithObjects:@"位移",@"缩放",@"旋转",@"组合",@"反转", nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
