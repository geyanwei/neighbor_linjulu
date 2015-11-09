//
//  ConnectionViewController.m
//  Neighbour
//
//  Created by apple2 on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "ConnectionViewController.h"

@interface ConnectionViewController ()

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"联系我们";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData
{
    NSMutableArray *sectionStr = [NSMutableArray arrayWithObjects:@"商业合作请联系",@"关于邻居录", nil];
    NSMutableArray *sectionArr = [NSMutableArray array];
    NSMutableArray *data_Arr_One = [NSMutableArray array];
    BaseCellModel *model_Email = [SubCellModel createModelWithIcon:@"youxiangx" title:@"邮箱" subTitle:@"2667899535@qq.com" vcStr:nil];
    BaseCellModel *model_qq = [SubCellModel createModelWithIcon:@"qqx" title:@"qq" subTitle:@"2667899535" vcStr:nil];
    [data_Arr_One addObject:model_Email];
    [data_Arr_One addObject:model_qq];
    [sectionArr addObject:data_Arr_One];
    
    NSMutableArray *data_Arr_Two = [NSMutableArray array];
    BaseCellModel *model_Sina = [SubCellModel createModelWithIcon:@"weibox" title:@"新浪微博" subTitle:@"@美食社区邻居录" vcStr:nil];
    BaseCellModel *model_WeiX = [SubCellModel createModelWithIcon:@"erweix" title:@"微信公众号" subTitle:@"2667899535@qq.com" vcStr:nil];
    [data_Arr_Two addObject:model_Sina];
    [data_Arr_Two addObject:model_WeiX];
    [sectionArr addObject:data_Arr_Two];
    
    self.sectionArr = sectionArr;
    self.sectionStr = sectionStr;
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
