//
//  UIViewController+MyViewController.m
//  Neighbour
//
//  Created by apple on 15/11/9.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "UIViewController+MyViewController.h"

@implementation UIViewController (MyViewController)

- (void)pushVcWithStr:(NSString *)str
{
    Class className = NSClassFromString(str);
    UIViewController *vc = [[className alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
