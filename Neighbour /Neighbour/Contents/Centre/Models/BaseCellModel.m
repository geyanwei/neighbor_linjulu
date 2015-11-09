//
//  BaseCellModel.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "BaseCellModel.h"

@implementation BaseCellModel

+ (BaseCellModel *)createModelWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle vcStr:(NSString *)vcStr;
{
    BaseCellModel *model = [[self alloc] init];
    model.icon = icon;
    model.title = title;
    model.subTitle = subTitle;
    model.vcStr = vcStr;
    return model;
}

@end
