//
//  CentreViewController.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "CentreViewController.h"


@interface CentreViewController ()

@end

@implementation CentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    
    
}

- (void)getData
{
    //section——first
    NSMutableArray *sectionArr = [NSMutableArray array];
    NSMutableArray *dataArr_One = [NSMutableArray array];
    BaseCellModel *model_Join_Act = [ArrowCellModel createModelWithIcon:@"canyux" title:@"参与的活动" subTitle:nil vcStr:nil];
    BaseCellModel *model_Publish_Act = [ArrowCellModel createModelWithIcon:@"bix" title:@"发布的活动" subTitle:nil vcStr:nil];
    BaseCellModel *model_Mysc = [ArrowCellModel createModelWithIcon:@"shouchangx" title:@"我的收藏" subTitle:nil vcStr:nil];
    [dataArr_One addObject:model_Join_Act];
    [dataArr_One addObject:model_Publish_Act];
    [dataArr_One addObject:model_Mysc];
    [sectionArr addObject:dataArr_One];
    
    
    
    //section——second
    NSMutableArray *dataArr_Two = [NSMutableArray array];
    BaseCellModel *model_Sug = [ArrowCellModel createModelWithIcon:@"yijianx" title:@"意见反馈" subTitle:nil vcStr:nil];
    model_Sug.blockClick = ^(){
        [self pushVC:@"SuggestionViewController"];
    };
    
    BaseCellModel *model_Rela = [ArrowCellModel createModelWithIcon:@"womenx" title:@"联系我们" subTitle:nil vcStr:nil];
    model_Rela.blockClick = ^(){
        [self pushVC:@"ConnectionViewController"];
    };
    [dataArr_Two addObject:model_Sug];
    [dataArr_Two addObject:model_Rela];
    [sectionArr addObject:dataArr_Two];
    
    
    
    //section——third
    NSMutableArray *dataArr_Thr = [NSMutableArray array];
    BaseCellModel *model_Set = [ArrowCellModel createModelWithIcon:@"shezhi" title:@"设置" subTitle:nil vcStr:nil];
    model_Set.blockClick = ^(){
        [self pushVC:@"SettingViewController"];
    };
    [dataArr_Thr addObject:model_Set];
    [sectionArr addObject:dataArr_Thr];
    self.sectionArr = sectionArr;
}


@end
