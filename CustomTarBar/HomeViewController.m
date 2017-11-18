//
//  HomeViewController.m
//  CustomTarBar
//
//  Created by 点点 on 2017/11/18.
//  Copyright © 2017年 DD. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"
#import "UIView+QKExtension.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    centerBtn.size = CGSizeMake(80, 30);
    centerBtn.center = self.view.center;
//    centerBtn.layer.borderWidth = 0.5f;
//    centerBtn.layer.cornerRadius = 5.f;
//    centerBtn.layer.masksToBounds = YES;
    [centerBtn addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
}

- (void)pushNextVC
{
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
