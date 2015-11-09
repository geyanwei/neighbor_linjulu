//
//  BlockButton.h
//  Neighbour
//
//  Created by apple on 15/11/3.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockBtn)();

@interface BlockButton : UIButton

@property (nonatomic, copy) BlockBtn blockClick;

+ (BlockButton *)createBtnWithType:(UIButtonType)type btnFrame:(CGRect)frame btnTitle:(NSString *)title normalImg:(NSString *)strImg andBlock:(BlockBtn)block;

@end