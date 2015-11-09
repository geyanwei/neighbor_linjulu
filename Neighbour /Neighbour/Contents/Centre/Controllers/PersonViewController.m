//
//  PersonViewController.m
//  Neighbour
//
//  Created by apple on 15/11/9.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "PersonViewController.h"

static NSString *cellName = @"personCell";
@interface PersonViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UITableView *myTable;
/**
 *  title
 */
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *detailArr;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpVC];
}

- (void)setUpVC
{
    self.icon.layer.cornerRadius = self.icon.frame.size.width * 0.5;
    self.icon.layer.masksToBounds = YES;
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
//    [self.myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellName];
    self.titleArr = @[@"昵称 :",@"性别 :",@"所在社区 :",@"生活家 :",@"账户信息 :",@"手机号 :",];
    self.detailArr = [NSMutableArray arrayWithObjects:@"吃西瓜的二小姐",@"女",@"康乐新村",@"未认证",@"",@"12569176142", nil];
    [self.myTable setTableFooterView:[[UIView alloc] init]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
    }
    
    if (indexPath.row != 4) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row %2 == 0) {
        cell.backgroundColor = RGBCOLOR(243, 244, 246);
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.detailTextLabel.text = self.detailArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
