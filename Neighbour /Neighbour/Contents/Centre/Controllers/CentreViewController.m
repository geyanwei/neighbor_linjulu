//
//  CentreViewController.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "CentreViewController.h"
#import "HeadView.h"

#define EDGEINSETS_TOP 178


@interface CentreViewController ()

@end

@implementation CentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    [self createHeaderView];
}

- (void)createHeaderView
{

    /**
     *  中心点
     */
//    CGFloat centreX = UISCREEN_WIDTH * 0.5;
//    
//    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, EDGEINSETS_TOP)];
//    [self.view addSubview:headView];
//    self.tableView.tableHeaderView = headView;
//    headView.backgroundColor = [UIColor purpleColor];
//    
//    CGFloat imgW = 50;
//    CGFloat imgX = (UISCREEN_WIDTH - imgW) * 0.5;
//    CGFloat imgY = 30;
//    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgW)];
//    [headView addSubview:headImg];
//    headImg.layer.cornerRadius = imgW * 0.5;
//    headImg.layer.masksToBounds = YES;
//    headImg.layer.borderWidth = 2;
//    headImg.layer.borderColor = [[UIColor whiteColor] CGColor];
//    headImg.backgroundColor = [UIColor redColor];
//    
//    BlockButton *nameBtn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectZero btnTitle:@"吃西瓜的二小姐" normalImg:@"nan" andBlock:^{
//        
//    }];
//    nameBtn.center = CGPointMake(centreX, 100);
//    nameBtn.bounds = CGRectMake(0, 0, UISCREEN_WIDTH, 25);
//    [headView addSubview:nameBtn];
//    
//    UILabel *addressTitle = [[UILabel alloc] init];
//    addressTitle.center = CGPointMake(centreX, 125);
//    addressTitle.bounds = CGRectMake(0, 0, UISCREEN_WIDTH, 20);
//    addressTitle.text = @"康乐新村";
//    addressTitle.textAlignment = NSTextAlignmentCenter;
//    addressTitle.textColor = [UIColor whiteColor];
//    [headView addSubview:addressTitle];
//
    
    HeadView *head = [[[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:nil options:nil] firstObject];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImgClick:)];
    [head.icon addGestureRecognizer:tap];
    self.tableView.tableHeaderView = head;
}
/**
 *  个人资料
 */

- (void)headImgClick:(UITapGestureRecognizer *)tap
{
    [self pushVcWithStr:@"PersonViewController"];
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
        [self pushVcWithStr:@"SuggestionViewController"];
    };
    
    BaseCellModel *model_Rela = [ArrowCellModel createModelWithIcon:@"womenx" title:@"联系我们" subTitle:nil vcStr:nil];
    model_Rela.blockClick = ^(){
        [self pushVcWithStr:@"ConnectionViewController"];

    };
    [dataArr_Two addObject:model_Sug];
    [dataArr_Two addObject:model_Rela];
    [sectionArr addObject:dataArr_Two];
 
    //section——third
    NSMutableArray *dataArr_Thr = [NSMutableArray array];
    BaseCellModel *model_Set = [ArrowCellModel createModelWithIcon:@"shezhi" title:@"设置" subTitle:nil vcStr:nil];
    model_Set.blockClick = ^(){
        [self pushVcWithStr:@"SettingViewController"];
    };
    [dataArr_Thr addObject:model_Set];
    [sectionArr addObject:dataArr_Thr];
    self.sectionArr = sectionArr;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}



@end
