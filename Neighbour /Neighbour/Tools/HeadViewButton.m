//
//  HeadViewButton.m
//  Neighbour
//
//  Created by apple on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "HeadViewButton.h"

@interface HeadViewButton ()

@property (nonatomic, assign) CGSize size;

@end

@implementation HeadViewButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _size = [self calculateSizeByText:self.currentTitle];
    }
    return self;
}

- (CGSize)calculateSizeByText:(NSString *)text
{
   CGSize size = [text  boundingRectWithSize:CGSizeMake(MAXFLOAT, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.tag]} context:nil].size;
    return size;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.tag == 20) {
        CGFloat imgW = 12;
        CGFloat imgx = (UISCREEN_WIDTH - _size.width) * 0.5 - 5;
        CGFloat imgY = (contentRect.size.height - 12) * 0.5;
        return CGRectMake(imgx, imgY, imgW, imgW);
    }
    else {
        
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            CGFloat imgW = 12;
            CGFloat imgx = (contentRect.size.width - _size.width) - 20;
            CGFloat imgY = (contentRect.size.height - 12) * 0.5;
            self.titleLabel.textColor = RGBCOLOR(229, 171, 71);
            return CGRectMake(imgx, imgY, imgW, imgW);
        }
        else {
            CGFloat imgW = 12;
            CGFloat imgx = 0;
            CGFloat imgY = (contentRect.size.height - 12) * 0.5;
            self.titleLabel.textColor = RGBCOLOR(228, 103, 66);
            return CGRectMake(imgx, imgY, imgW, imgW);
        }
    }
}


@end
