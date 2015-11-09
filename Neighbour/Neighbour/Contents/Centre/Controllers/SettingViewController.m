//
//  SettingViewController.m
//  Neighbour
//
//  Created by apple2 on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    // Do any additional setup after loading the view.
    [self createButton];
    
    //加载导航栏的返回字
    [self createNavBackState];
}

- (void)createNavBackState
{
    //设置返回时的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //隐藏导航栏左边的返回键上的字
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"r_c_backbtn"] style:UIBarButtonItemStyleDone target:self action:@selector(fanhui)];
    //设置图片
    self.navigationItem.leftBarButtonItem = btnItem;
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createButton
{
    BlockButton *btn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectMake(10, 180, UISCREEN_WIDTH-20, 45) btnTitle:@"退出登录" normalImg:nil andBlock:nil];
    btn.backgroundColor = RGBCOLOR(62, 178, 119);
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:20 weight:5];
    [self.view addSubview:btn];
    btn.blockClick = ^(){
        NSLog(@"sadasdas");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData{
    NSMutableArray *sectionArr = [NSMutableArray array];
    NSMutableArray *data_Arr_One = [NSMutableArray array];
    BaseCellModel *model_PW = [ArrowCellModel createModelWithIcon:@"gaimi" title:@"修改密码" subTitle:nil vcStr:nil];
    BaseCellModel *model_Point = [ArrowCellModel createModelWithIcon:@"pinglienx" title:@"给我们打分" subTitle:nil vcStr:nil];
    BaseCellModel *model_About = [ArrowCellModel createModelWithIcon:@"zhongxinx" title:@"关于我们" subTitle:nil vcStr:nil];
    [data_Arr_One addObject:model_PW];
    [data_Arr_One addObject:model_Point];
    [data_Arr_One addObject:model_About];
    [sectionArr addObject:data_Arr_One];
    self.sectionArr = sectionArr;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
