//
//  NavigationController.m
//  Neighbour
//
//  Created by apple on 15/11/3.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];

}

/**
 *  初始化NavgationBar
 */
- (void)initNavgationBar
{
    [[UINavigationBar appearance]setBarTintColor:RGBCOLOR(60,178,118)];
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21 weight:5],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //隐藏导航栏左边的返回键上的字
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_Backbtn.png"] style:UIBarButtonItemStyleDone target:self action:@selector(fanhui)];
    //设置图片
    self.navigationItem.leftBarButtonItem = btnItem;
}

-(void)fanhui{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
