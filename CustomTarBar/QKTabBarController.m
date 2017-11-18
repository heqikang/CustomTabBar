//
//  QKTabBarController.m
//  CustomTarBar
//
//  Created by 点点 on 2017/11/18.
//  Copyright © 2017年 DD. All rights reserved.
//

#import "QKTabBarController.h"
#import "HomeViewController.h"
#import "OrderViewController.h"
#import "NewsViewController.h"
#import "MeViewController.h"
#import "QKNavigationController.h"
#import "QKTabBar.h"

@interface QKTabBarController ()

@end

@implementation QKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[OrderViewController alloc] init] title:@"订单" image:@"tabBar_find" selectedImage:@"tabBar_find_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[NewsViewController alloc] init] title:@"资讯" image:@"tabBar_find" selectedImage:@"tabBar_find_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[MeViewController alloc] init] title:@"我的" image:@"tabBar_me" selectedImage:@"tabBar_me_click" isHiddenNavgationBar:NO];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
    [self setCustomtabbar];
}

#pragma mark - 设置自定义中心按钮
- (void)setCustomtabbar{
    QKTabBar *tabbar = [[QKTabBar alloc]init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
}

#pragma mark - 自定义中心按钮相应方法
- (void)centerBtnClick:(UIButton *)btn{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你点击了订单按钮" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden
{
    static NSInteger index = 0;
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.tag = index;
    index++;
    QKNavigationController *nav = [[QKNavigationController alloc] initWithRootViewController:vc];
    if (isHidden) {
        nav.navigationBar.hidden = YES;
    }
    
    [self addChildViewController:nav];
}

// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:153.0/255.0 green:93.0/255.0 blue:176.0/255.0 alpha:1];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
