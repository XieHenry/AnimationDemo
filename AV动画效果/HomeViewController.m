//
//  HomeViewController.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/31.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "HomeViewController.h"
#import "CenterViewController.h"
#import "KeyFrameViewController.h"
#import "IntegrationAnimationController.h"
#import "AffineTransformController.h"
#import "TransitionAnimationController.h"
#import "GroupAnimationController.h"

@interface HomeViewController () <UITableViewDelegate,UITableViewDataSource>
//单元格
@property (nonatomic, strong) UITableView *tableView;

//数组
@property (nonatomic, strong) NSArray *animationArray;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"首页";
    
    [self initView];
    
    [self initData];
    
}

//设置单元格数据源
- (void)initData {
    self.animationArray = [NSArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组合动画",@"过渡动画",@"仿射变换",@"综合案例",nil];
}

//配置单元格
- (void)initView {
    // 设置单元格
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark- tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier
                ];
    }
    cell.textLabel.text = [_animationArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *VC;
    
    switch (indexPath.row) {
        case 0:
            // 基础动画
            VC = [[CenterViewController alloc]init];
            break;
        case 1:
            // 关键帧动画
            VC = [[KeyFrameViewController alloc]init];
            break;
        case 2:
            // 组合动画
            VC = [[GroupAnimationController alloc]init];
            break;
        case 3:
            // 过渡动画
            VC = [[TransitionAnimationController alloc]init];
            break;
        case 4:
            // 仿射变换
            VC = [[AffineTransformController alloc]init];
            break;
        case 5:
            // 综合案例
            VC = [[IntegrationAnimationController alloc]init];
            break;
            
        default:
            break;
    }
    //页面切换
    [self.navigationController pushViewController:VC animated:YES];
}

@end
