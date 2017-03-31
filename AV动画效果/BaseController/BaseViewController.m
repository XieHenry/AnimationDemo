//
//  BaseViewController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/30.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomButton.h"

@interface BaseViewController ()
@property (nonatomic, strong) NSArray *btnTitleArray;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = [self controllerTitle];

    
    [self initData];
    [self initView];

}

- (void)initView {
    
    //动态创建按钮功能
    if (_btnTitleArray && _btnTitleArray.count >0) {
        //通过三目运算符来决定按钮行数
        NSInteger row = _btnTitleArray.count % 4 == 0 ? _btnTitleArray.count/4 : _btnTitleArray.count/4 +1;
        
        //创建一个底部视图用来存放按钮
        UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-(row*50+20), SCREEN_WIDTH, row*50+20)];
        footerView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:footerView];
        
        for (int i=0; i<_btnTitleArray.count; i++) {
            CustomButton *btn = [[CustomButton alloc]initWithFrame:[self rectForBtnAtIndex:i totalNum:_btnTitleArray.count] withTitle:_btnTitleArray[i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            [footerView addSubview:btn];
        }
    }
    
}

- (void)initData {
    _btnTitleArray = [self btnTitleArray];
}

//按钮点击
- (void)clickBtn:(UIButton *)btn{
    
}

- (NSString *)controllerTitle {
    return @"默认";
}


//按钮的frame计算
- (CGRect)rectForBtnAtIndex : (NSInteger)index totalNum: (NSUInteger)totalNum {
    //每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    //每个按钮之间的距离（间接距）（行间距）
    CGFloat marginCol = 20;
    CGFloat marginRow = 20;
    
    //按钮宽度
    CGFloat width = (SCREEN_WIDTH - marginCol * 5)/4;
    CGFloat height = 30;
    
    //每个按钮的位移
    //X：间距 + 列数*对应宽度 + 间距
    CGFloat offSetX = marginCol + (index % maxColumnNum) * (width + marginCol);
    //Y：间距+行数 *对应高度+间距
    CGFloat offSetY = marginRow + (index/maxColumnNum) * (height + marginRow);
    
    
    
    return CGRectMake(offSetX, offSetY, width, height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
