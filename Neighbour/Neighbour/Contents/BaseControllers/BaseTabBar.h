//
//  BaseTabBar.h
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)(NSInteger index);
@interface BaseTabBar : UIView


@property (nonatomic, copy) myBlock blockClick;

- (void)addItemWithTitle:(NSString *)title normalImg:(NSString *)normalStr selectImg:(NSString *)selectStr;


@end
