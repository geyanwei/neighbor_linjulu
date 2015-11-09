//
//  BaseTabBar.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "BaseTabBar.h"
#import "MyTabBarButton.h"

@interface BaseTabBar ()

@property (nonatomic, strong) MyTabBarButton *selectBtn;

@end

@implementation BaseTabBar


- (void)addItemWithTitle:(NSString *)title normalImg:(NSString *)normalStr selectImg:(NSString *)selectStr
{
        //77 174 116
    MyTabBarButton *btn = [MyTabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:normalStr] forState:UIControlStateNormal];
    [btn setImage:[[UIImage imageNamed:selectStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    btn.tag = self.subviews.count;
    if (btn.tag == 0) {
        btn.selected = YES;
        _selectBtn = btn;
    }
    [self addSubview:btn];
}

- (void)btnClick:(MyTabBarButton *)sender
{
    if (sender.tag != _selectBtn.tag) {
        /**
         *  切换控制器
         */
        _selectBtn.selected = NO;
        sender.selected = YES;
        _selectBtn = sender;
        self.blockClick(sender.tag);
    }
}

- (void)layoutSubviews
{
    CGFloat btnW = UISCREEN_WIDTH / self.subviews.count;
    for (int i = 0; i < self.subviews.count; i++) {
        MyTabBarButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnW * i, 0, btnW, 44);
    }
}

@end
