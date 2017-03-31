//
//  BaseViewController.h
//  AV动画效果
//
//  Created by XieHenry on 2017/3/30.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//当前控制器的标题
- (NSString *)controllerTitle;


//初始化视图
- (void)initView;

//按钮数组
- (NSArray *)btnTitleArray;

//每个按钮的点击事件
-(void)clickBtn:(UIButton *)btn;

@end
