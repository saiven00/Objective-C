//
//  XABaseViewControllerManager.m
//  XAHealth
//
//  Created by 刘少毅 on 2017/6/20.
//  Copyright © 2017年 XingYang. All rights reserved.
//

#import "XABaseViewControllerManager.h"
#import "XAMenuViewController.h"
#import "XAMainTabBarController.h"
#import "XACommonDefine.h"

#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"



@implementation XABaseViewControllerManager

+ (void)chooseViewController
{
    XAMenuViewController *menuView = [[XAMenuViewController alloc] init];
    
    UINavigationController *centerNEV = [[UINavigationController alloc] initWithRootViewController:[[XAMainTabBarController alloc] init]];
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerNEV leftDrawerViewController:menuView];
    [drawerController setShowsShadow:YES];
    [drawerController setMaximumLeftDrawerWidth:kScreenWidth-100];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [[MMExampleDrawerVisualStateManager sharedManager]
                 drawerVisualStateBlockForDrawerSide:drawerSide];
        if(block){
            block(drawerController, drawerSide, percentVisible);
        }
        
    }];//侧滑效果
    [UIApplication sharedApplication].keyWindow.rootViewController = drawerController;
}
@end
