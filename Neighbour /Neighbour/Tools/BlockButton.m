//
//  BlockButton.m
//  Neighbour
//
//  Created by apple on 15/11/3.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "BlockButton.h"

@implementation BlockButton

+ (BlockButton *)createBtnWithType:(UIButtonType)type btnFrame:(CGRect)frame btnTitle:(NSString *)title normalImg:(NSString *)strImg andBlock:(BlockBtn)block
{
    BlockButton *btn = [BlockButton buttonWithType:type];
    btn.frame = frame;
    btn.blockClick = block;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:strImg] forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return btn;
}

- (void)btnClick:(BlockButton *)sender
{
    if (sender.blockClick) {
        sender.blockClick();

    }
}

@end