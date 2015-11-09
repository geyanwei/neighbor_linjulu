//
//  SuggestionViewController.m
//  Neighbour
//
//  Created by apple2 on 15/11/7.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "SuggestionViewController.h"

@interface SuggestionViewController ()

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"意见反馈";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = RGBCOLOR(243, 244, 246);
    
    //加载导航栏的返回字
    [self createNavBackState];
    
    //加载页面
    [self jiaZaiView];
}

//加载页面视图
-(void)jiaZaiView{
    
    //创建文本框，输入要提交的信息
    _textView.backgroundColor = RGBCOLOR(254, 255, 255);
    _textView.textColor = RGBCOLOR(117, 113, 114);
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.delegate = self;
    
    //创建一个button,用来提交输入的信息
    BlockButton *btn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectMake(10, _textView.bounds.origin.y+_textView.bounds.size.height+90, UISCREEN_WIDTH-20, 45) btnTitle:@"确定" normalImg:nil andBlock:nil];
    btn.backgroundColor = RGBCOLOR(62, 178, 119);
    btn.layer.cornerRadius = 3;
    btn.clipsToBounds = YES;
    btn.blockClick = ^(){
        [self clickedSureNick];
    };
    [self.view addSubview:btn];
}

#pragma mark  ======UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([_textView.text isEqualToString:@""]||[_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
        _textView.text = @"";
    }else{
        return;
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    textView.textColor = [UIColor blackColor];
    if( [ @"\n" isEqualToString: text]){
        if ([_textView.text isEqualToString:@""]||[_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
            _textView.textColor = RGBCOLOR(117, 113, 114);
            _textView.text = @"您的宝贵意见是对我们最大的肯定～～";
        }
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}


-(void)clickedSureNick{
    
    if ([_textView.text isEqualToString:@""]||[_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
        UIAlertView *alertView_Null = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"反馈不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView_Null show];
    }else{
        
    }
}

-(void)fanKuiSuccess{
    if (![_textView.text isEqualToString:@""]&&![_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
        _textView.text = @"";
        [self performSelector:@selector(backView) withObject:nil afterDelay:.2];
    }
    
}

#pragma mark === UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [_textView endEditing:YES];
    if (buttonIndex==1) {
        if (![_textView.text isEqualToString:@""]&&![_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
            _textView.text = @"";
            [self performSelector:@selector(backView) withObject:nil afterDelay:.5];
        }
    }
}

-(void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

//取消第一响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if ([_textView.text isEqualToString:@""]||[_textView.text isEqualToString:@"您的宝贵意见是对我们最大的肯定～～"]) {
        _textView.textColor = RGBCOLOR(117, 113, 114);
        _textView.text = @"您的宝贵意见是对我们最大的肯定～～";
    }
    
}

- (void)createNavBackState
{
    //隐藏导航栏左边的返回键上的字
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"看看" style:UIBarButtonItemStylePlain target:self action:@selector(fanhui)];
    [btnItem setImage:[UIImage imageNamed:@"r_c_backbtn"]];
 
    //设置图片
    self.navigationItem.leftBarButtonItem = btnItem;
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
