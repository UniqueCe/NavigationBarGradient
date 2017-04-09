//
//  ViewController.m
//  NavigationBarGradient
//
//  Created by 刘培策 on 17/4/9.
//  Copyright © 2017年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "asdwViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UIView *headerView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUITableView];
    
    [self setupUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

-(void)setupUI {
    
    UIView *view = [[UIView alloc] init];
    _headerView = view;
    view.frame = CGRectMake(0, 0, ScreenWidth, 64);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"hhaha"];
    imageV.bounds = CGRectMake(0, 0, 36, 36);
    imageV.center = CGPointMake(28, 42);
    [view addSubview:imageV];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"hhaha"] forState:UIControlStateNormal];
    btn.bounds = CGRectMake(0, 0, 36, 36);
    btn.center = CGPointMake(ScreenWidth-28, 42);
    [btn addTarget:self action:@selector(gotoasdw) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    
    CGFloat TextFieldWidth = ScreenWidth - (imageV.frame.origin.x + imageV.bounds.size.width)*2 - 30;
    UITextField *text = [[UITextField alloc] init];
    text.bounds = CGRectMake(0, 0, TextFieldWidth, 35);
    text.center = CGPointMake(ScreenWidth/2, 42);
    text.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:text];
}

- (void)gotoasdw {
    
    asdwViewController *asdw = [[asdwViewController alloc] init];
    [self.navigationController pushViewController:asdw animated:YES];
}

- (void)setupUITableView {
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, ScreenWidth, ScreenHeight+20) style:UITableViewStyleGrouped];
    
    table.dataSource = self;
    table.delegate = self;
    
    [self.view addSubview:table];
    
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
}

#pragma mark-->UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.textLabel.text = @"haha";
    
    return cell;
}

#pragma mark-->UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y;
    UIColor *color = [UIColor orangeColor];
    
    if (offset > 50) {
        
        if (offset >= 100) {
            
            offset = 100;
        }
        CGFloat alpha = (offset - 50)/50;
        
        _headerView.backgroundColor = [color colorWithAlphaComponent:alpha];
        
    }else {
        
        _headerView.backgroundColor = [UIColor clearColor];
    }
    
    if (offset < -80) {
        
        _headerView.hidden = YES;
    }else {
        
        _headerView.hidden = NO;
    }
    
}



@end

