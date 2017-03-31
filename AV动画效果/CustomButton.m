//
//  CustomButton.m
//  AV动画效果
//
//  Created by XieHenry on 2017/3/30.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

@end
