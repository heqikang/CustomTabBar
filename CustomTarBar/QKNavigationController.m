//
//  QKNavigationController.m
//  CustomTarBar
//
//  Created by 点点 on 2017/11/18.
//  Copyright © 2017年 DD. All rights reserved.
//

#import "QKNavigationController.h"

@interface QKNavigationController ()

@end

@implementation QKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;
}

+ (void)initialize
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:153.0/255.0 green:93.0/255.0 blue:176.0/255.0 alpha:1]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:153.0/255.0 green:93.0/255.0 blue:176.0/255.0 alpha:1]];
    //修改标题字体颜色及大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        //自定义返回按钮图片样式
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont systemFontOfSize:15];
        // 让按钮内部的所有内容左对齐
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0); // 这里微调返回键的位置可以让它看上去和左边紧贴
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    //解决iPhone X push页面时 tabBar上移的问题
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
