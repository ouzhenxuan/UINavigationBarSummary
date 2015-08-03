//
//  zidingyiViewController.m
//  alilvyou
//
//  Created by ozx on 15/8/3.
//  Copyright (c) 2015年 ozx. All rights reserved.
//

#import "zidingyiViewController.h"
#define wScream [UIScreen mainScreen].bounds.size.width
#define hScream [UIScreen mainScreen].bounds.size.height

@interface zidingyiViewController ()
{
    UIScrollView *scrollView;
}
@end

@implementation zidingyiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
        在自定义导航栏中,如果要设置穿透,那么就要设置bar的透明度(这不如直接用UIView),然后再讲title,btn这些add到self.view上面
     所以说,没必要.
     */
    
    UINavigationBar *customNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, wScream, 64)];
    UIImageView *navigationBarBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavBar641"]];
    navigationBarBackgroundImageView.contentMode = UIViewContentModeScaleToFill;
    navigationBarBackgroundImageView.backgroundColor = [UIColor yellowColor];
    navigationBarBackgroundImageView.frame = customNavigationBar.bounds;
    [customNavigationBar addSubview:navigationBarBackgroundImageView];
    UINavigationItem *navigationTitle = [[UINavigationItem alloc] initWithTitle:@"123"];
    [customNavigationBar pushNavigationItem:navigationTitle animated:NO];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    btn.backgroundColor = [UIColor greenColor];
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithCustomView:btn];
    navigationTitle.leftBarButtonItem = left;

    UIImageView * imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    imageView.contentMode = UIViewContentModeTop;
    imageView.frame = self.view.bounds;
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, wScream, hScream)];
    scrollView.contentSize= CGSizeMake(wScream, hScream+500);
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    
    
    [self.view addSubview:customNavigationBar];
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
