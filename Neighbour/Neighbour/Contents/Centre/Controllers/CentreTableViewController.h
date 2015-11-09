//
//  CentreTableViewController.h
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrowCellModel.h"
#import "SubCellModel.h"
#import "BaseCellModel.h"


@interface CentreTableViewController : UITableViewController

//组数组
@property (nonatomic, strong) NSMutableArray *sectionArr;
@property (nonatomic, strong) NSMutableArray *sectionStr;
//跳转控制器
- (void)pushVC:(NSString *)vcStr;
- (void)getData;

@end
