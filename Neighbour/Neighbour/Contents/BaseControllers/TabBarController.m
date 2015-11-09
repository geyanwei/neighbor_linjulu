//
//  TabBarController.m
//  Neighbour
//
//  Created by apple on 15/11/3.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "BaseTabBar.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNav];
    [self createTabBarItem];
}

- (void)createTabBarItem
{
    BaseTabBar *myTabBar = [[BaseTabBar alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:myTabBar];
    [myTabBar addItemWithTitle:@"活动" normalImg:@"huodong" selectImg:@"huodonglv"];
    [myTabBar addItemWithTitle:@"发布" normalImg:@"fabu" selectImg:@"fabulv"];
    [myTabBar addItemWithTitle:@"中心" normalImg:@"geren" selectImg:@"gerenlv"];
    myTabBar.blockClick = ^(NSInteger index){
        self.selectedIndex = index;
    };
}

- (void)createNav
{
    //加控制器
    [self addNavgationWithVcStr:@"ActivityViewController" normalImg:nil selectImg:nil];
    [self addNavgationWithVcStr:@"PublishViewController" normalImg:nil selectImg:nil];
    [self addNavgationWithVcStr:@"CentreViewController" normalImg:nil selectImg:nil];

}

- (void)addNavgationWithVcStr:(NSString *)vcStr normalImg:(NSString *)normalStr selectImg:(NSString *)selectStr
{
    Class vc = NSClassFromString(vcStr);
    UIViewController *viewVC = [[vc alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:viewVC];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:self.viewControllers];
    [muArr addObject:nav];
    self.viewControllers = muArr;
}

@end
