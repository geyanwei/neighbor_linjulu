//
//  HeadView.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    self.icon.layer.cornerRadius = self.icon.frame.size.width * 0.5;
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.borderWidth = 2;
    self.icon.layer.borderColor = [[UIColor whiteColor] CGColor];
}

@end
