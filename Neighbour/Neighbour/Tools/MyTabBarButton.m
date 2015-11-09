//
//  MyTabBarButton.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "MyTabBarButton.h"

@implementation MyTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
//    CGFloat btnH = contentRect.size.height;
//    CGFloat btnW = contentRect.size.width;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    CGFloat imgW = 25.f;
    CGFloat imgX = (contentRect.size.width - imgW) * 0.5;
    CGFloat margin = 5;
    return CGRectMake(imgX, margin, imgW, imgW);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
 
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = 12;
    return CGRectMake(0, 34, titleW, titleH);
}

@end
