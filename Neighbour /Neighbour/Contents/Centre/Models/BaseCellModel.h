//
//  BaseCellModel.h
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^myBlock)();

@interface BaseCellModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *vcStr;

@property (nonatomic, copy) myBlock blockClick;

+ (BaseCellModel *)createModelWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle vcStr:(NSString *)vcStr;

@end
