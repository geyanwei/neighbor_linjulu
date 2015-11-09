//
//  SuggestionViewController.h
//  Neighbour
//
//  Created by apple2 on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "RootViewController.h"

@interface SuggestionViewController : RootViewController<UITextViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
