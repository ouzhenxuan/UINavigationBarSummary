//
//  ViewController.m
//  alilvyou
//
//  Created by ozx on 15/7/31.
//  Copyright (c) 2015年 ozx. All rights reserved.
//

#import "ViewController.h"

#import "UIView+MJExtension.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "zidingyiViewController.h"

#define wScream [UIScreen mainScreen].bounds.size.width
#define hScream [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
    UIScrollView * scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINavigationBar * bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, wScream, 64)];
    bar.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:bar];
    bar.translucent = NO;
    
    UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:@"shenmegui"];
    UIImageView * itemImageView = [[UIImageView alloc] initWithFrame:bar.bounds];
    itemImageView.backgroundColor = [UIColor greenColor];
    [bar addSubview:itemImageView];
    [bar pushNavigationItem:item  animated:YES];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    NSString * navBarBg = @"NavBar";
//    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
//    navBar.translucent = YES;
    
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];//隐藏了导航栏
    
//    self.navigationController.navigationBar.translucent = NO;
    
    UIImageView * imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    imageView.contentMode = UIViewContentModeTop;
    imageView.frame = self.view.bounds;
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, wScream, hScream)];
    scrollView.contentSize= CGSizeMake(wScream, hScream+500);
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    [btn1 setTitle:@"自定义导航栏" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:btn1];//打开一个自定义的导航栏.
    [btn1 addTarget:self action:@selector(zidingyi) forControlEvents:UIControlEventTouchDown];
    
    scrollView.header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [scrollView.header beginRefreshing];
    
}
-(void)loadNewData{
    NSLog(@"123");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [scrollView.header endRefreshing];
    });
}

-(void)zidingyi{
    zidingyiViewController * zdyVc = [[zidingyiViewController alloc] init];
    [self presentViewController:zdyVc animated:YES completion:^{}];
//    [self.navigationController pushViewController:zdyVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
