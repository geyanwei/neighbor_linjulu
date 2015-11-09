//
//  LoginViewController.m
//  Neighbour
//
//  Created by apple on 15/11/4.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "LoginViewController.h"

#define LINE_WIDTH 1
#define LINE_ALPHA 0.6

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScroll;

/**
 *  是否是电话
 */
@property (nonatomic, assign) BOOL isPhoneNum;

@property (weak, nonatomic) UIButton *loginBtn;


@property (nonatomic, weak) UIView *userView;
@property (nonatomic, weak) UIView *verificationView;
@property (nonatomic, weak) UIView *passWordView;
@property (nonatomic, weak) UIView *btnView;


@property (nonatomic, weak) UITextField *userTf;
@property (nonatomic, weak) UITextField *verificationTf;
@property (nonatomic, weak) UITextField *passWordTf;


//30,103, ,45
/**
 *  用于判断是否删除
 */
@property (nonatomic, assign) int count;
/**
 *  记录登陆/注册按钮的原始坐标
 */
@property (nonatomic, assign) CGRect btnRect;
/**
 *  记录密码框的原始坐标
 */
@property (nonatomic, assign) CGRect passWordRect;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVC];
    [self createLeftBtn];
    [self createView];
}

/**
 *  对vc进行一些初始化
 */
- (void)initVC
{
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"注册";
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.alpha = 0;
}

/**
 *  创建View
 */
- (void)createView
{
    CGFloat margin = 30;
    CGFloat viewW = UISCREEN_WIDTH - margin * 2;
    /**
     *  用户名
     */
    UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(margin, 103, viewW, 45)];
    _userView = userView;
    [self.myScroll addSubview:userView];
    UIImageView *userImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 11, 23, 23)];
    userImg.image = [UIImage imageNamed:@"man"];
    [userView addSubview:userImg];
    
    UIView *userLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userImg.frame) + 20, 15, LINE_WIDTH, 15)];
    userLine.alpha = LINE_ALPHA;
    userLine.backgroundColor = [UIColor whiteColor];
    [userView addSubview:userLine];
    
    CGFloat textFleidX = CGRectGetMaxX(userImg.frame) + 40;
    CGFloat textFleidW = viewW - textFleidX;
    
    UIView *userBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 45, viewW, LINE_WIDTH)];
    userBottom.backgroundColor = [UIColor whiteColor];
    userBottom.alpha = LINE_ALPHA;
    [userView addSubview:userBottom];
    
    UITextField *userTf = [[UITextField alloc] initWithFrame:CGRectMake(textFleidX, 10, textFleidW, 25)];
    userTf.textColor = [UIColor whiteColor];
    userTf.font = [UIFont systemFontOfSize:18];
    [userTf setKeyboardType:UIKeyboardTypeNumberPad];
    userTf.placeholder = @"请输入手机号";
    [userTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    userTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    userTf.delegate = self;
    
    [userView addSubview:userTf];
    _userTf = userTf;
    
    
    
    /**
     *  验证
     */
    UIView *verificationView = [[UIView alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(userView.frame), viewW, 45)];
    //verificationView.backgroundColor = [UIColor grayColor];
    [self.myScroll addSubview:verificationView];
    UIImageView *verificationImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 11, 23, 23)];
    verificationImg.image = [UIImage imageNamed:@"1"];
    [verificationView addSubview:verificationImg];
    
    UIView *verificationLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userImg.frame) + 20, 15, LINE_WIDTH, 15)];
    verificationLine.backgroundColor = [UIColor whiteColor];
    verificationLine.alpha = LINE_ALPHA;

    [verificationView addSubview:verificationLine];
    
    UIView *verificationBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 45, viewW, LINE_WIDTH)];
    verificationBottom.backgroundColor = [UIColor whiteColor];
    [verificationView addSubview:verificationBottom];
    verificationBottom.alpha = LINE_ALPHA;
    
    UITextField *verificationTf = [[UITextField alloc] initWithFrame:CGRectMake(textFleidX, 10, textFleidW - 120.f, 25)];
    verificationTf.textColor = [UIColor whiteColor];
    verificationTf.font = [UIFont systemFontOfSize:18];
    [verificationTf setKeyboardType:UIKeyboardTypeNumberPad];
    verificationTf.placeholder = @"请输入验证码";
    [verificationTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [verificationView addSubview:verificationTf];
    
    CGFloat btnW = 80;
    BlockButton *btn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectMake(viewW - btnW, 10, btnW, 25) btnTitle:@"获取验证码" normalImg:nil andBlock:^{
       //获取验证码
        NSLog(@"获取验证码");
        
    }];
    btn.alpha = LINE_ALPHA;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [verificationView addSubview:btn];
    
    _verificationView = verificationView;
    _verificationTf = verificationTf;
    _verificationView.hidden = YES;


    /**
     *  密码
     */
    UIView *passWordView = [[UIView alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(verificationView.frame), viewW, 45)];
    //passWordView.backgroundColor = [UIColor yellowColor];
    [self.myScroll addSubview:passWordView];
    UIImageView *passWordImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 11, 23, 23)];
    passWordImg.image = [UIImage imageNamed:@"2"];
    [passWordView addSubview:passWordImg];
    
    UIView *passWordLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userImg.frame) + 20, 15, LINE_WIDTH, 15)];
    passWordLine.backgroundColor = [UIColor whiteColor];
    [passWordView addSubview:passWordLine];
    passWordLine.alpha = LINE_ALPHA;

    
    UIView *passWordBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 45, viewW, LINE_WIDTH)];
    passWordBottom.backgroundColor = [UIColor whiteColor];
    [passWordView addSubview:passWordBottom];
    passWordBottom.alpha = LINE_ALPHA;
    
    UITextField *passWordTf = [[UITextField alloc] initWithFrame:CGRectMake(textFleidX, 10, textFleidW, 25)];
    passWordTf.textColor = [UIColor whiteColor];
    passWordTf.font = [UIFont systemFontOfSize:18];
    passWordTf.placeholder = @"请输入密码";
//    passWordTf.
    [passWordTf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passWordView addSubview:passWordTf];
    
    _passWordView = passWordView;
    _passWordTf = passWordTf;
    _passWordView.hidden = YES;
    
    
    
    /**
     * 按钮
     */
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(userView.frame) + 15, viewW, 75)];
    [self.myScroll addSubview:btnView];
    BlockButton *loginBtn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectMake(0, 0, viewW, 45) btnTitle:@"登陆/注册" normalImg:nil andBlock:^{
        //处理
        NSLog(@"登陆");
        
    }];
    _btnView = loginBtn;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    loginBtn.backgroundColor = [UIColor colorWithRed:0 green:50 blue:0 alpha:0.3];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnView addSubview:loginBtn];
    
    BlockButton *noPassWordBtn = [BlockButton createBtnWithType:UIButtonTypeCustom btnFrame:CGRectMake(0, CGRectGetMaxY(loginBtn.frame) + 10, viewW, btnView.frame.size.height - 45) btnTitle:@"忘记密码" normalImg:nil andBlock:^{

        NSLog(@"忘记密码");

    }];
    
    
    [noPassWordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    noPassWordBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btnView addSubview:noPassWordBtn];
    _btnView = btnView;
    
    
    /**
     *  记录原始坐标
     */
    _btnRect = _btnView.frame;
    _passWordRect = _passWordView.frame;
    [_userTf addTarget:self action:@selector(phoneNumValueChange:) forControlEvents:UIControlEventEditingChanged];

}

- (void)createLeftBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 23, 23);
    [btn setBackgroundImage:[UIImage imageNamed:@"r_c_backbtn"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
//    NSString *path = [@"" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    NSURL *url = [NSURL URLWithString:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        
//    }];
    
    
#pragma mark UITextFieldDelegate
    
}

- (void)phoneNumValueChange:(UITextField *)textField
{
    /**
     *  用于限制格式为:111 1111 1111
     */
    if ((_userTf.text.length == 4 || _userTf.text.length == 9) && _count < _userTf.text.length) {
        NSMutableString *str = [NSMutableString stringWithString:_userTf.text];
        [str insertString:@" " atIndex:_userTf.text.length - 1];
        _userTf.text = str;
        _count ++;
    }
    if (_count < _userTf.text.length) {
        _count ++;
    }
    else {
        _count --;
        if (_count == 9 || _count == 4) {
            _count --;
            _userTf.text = [_userTf.text substringToIndex:_count];
        }
    }
    
    
    /**
     *  判断注册/登陆
     */
    if (_userTf.text.length >= 13) {
        _userTf.text = [_userTf.text substringToIndex:13];
        _count = (int)_userTf.text.length;
        if ([_userTf.text isEqualToString:@"132 0700 4141"]) {
            /**
             *  是账号
             */
            if (_passWordView.hidden == YES) {
                CGRect rect = _btnRect;
                rect.origin.y += 45;
                _btnView.frame = rect;
                
                CGRect rect1 = _passWordView.frame;
                rect1.origin.y -= 45;
                _passWordView.frame = rect1;
                [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];

            }
            _passWordView.hidden = NO;
        }
        else {
            /**
             *  不是账号
             */
            CGRect rect = _btnRect;
            rect.origin.y += 90;
            _passWordView.frame = _passWordRect;
            _btnView.frame = rect;
            _verificationView.hidden = NO;
            _passWordView.hidden = NO;
            [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];

        }
    }
    else {
        /**
         *  不是11位,注册
         */
        _passWordView.hidden = YES;
        _verificationView.hidden = YES;
        _passWordView.frame = _passWordRect;
        _btnView.frame = _btnRect;
        [_loginBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
