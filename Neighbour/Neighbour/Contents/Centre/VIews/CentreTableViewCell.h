//
//  CentreTableViewCell.h
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"


@interface CentreTableViewCell : UITableViewCell

@property (nonatomic, strong) BaseCellModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end
