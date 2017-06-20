//
//  XAMainTabBarController.m
//  XAHealth
//
//  Created by 刘少毅 on 2017/6/20.
//  Copyright © 2017年 XingYang. All rights reserved.
//

#import "XAMainTabBarController.h"
#import "XACommonDefine.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

@interface XAMainTabBarController ()

@end

@implementation XAMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initChildrenViewController];
    
    [self initMenuItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}
- (void)initChildrenViewController
{
    //1.首页
    UIViewController *homeVC = [[UIViewController alloc] init];
    [self addChildVC:homeVC withTitle:@"首页" itemTitle:@"首页" imgName:@"main_home" selectedImgName:@"main_home"];
    
    //2.记录
    UIViewController *recordVC = [[UIViewController alloc] init];
    [self addChildVC:recordVC withTitle:@"记录" itemTitle:@"记录" imgName:@"main_home" selectedImgName:@"main_home"];
    //3.个人中心
    UIViewController *discoverVC = [[UIViewController alloc] init];
    [self addChildVC:discoverVC withTitle:@"发现" itemTitle:@"发现" imgName:@"main_home" selectedImgName:@"main_home"];
    //4.更多
    UIViewController *personalCenterVC = [[UIViewController alloc] init];
    [self addChildVC:personalCenterVC withTitle:@"我的" itemTitle:@"我的" imgName:@"main_home" selectedImgName:@"main_home"];
    
    
}

- (void)addChildVC:(UIViewController *)childVC withTitle:(NSString *)title itemTitle:(NSString *)itemTitle imgName:(NSString *)img selectedImgName:(NSString *)selectedImg
{
    childVC.view.backgroundColor = XARandomColor;
    childVC.title = title;
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:itemTitle image:[UIImage imageNamed:img] selectedImage:[UIImage imageNamed:selectedImg]];
    childVC.tabBarItem = item;
    
    UINavigationController *nav = [[UINavigationController alloc ] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
}

- (void)initMenuItem
{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end
