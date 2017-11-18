//
//  AppDelegate.h
//  CustomTarBar
//
//  Created by 点点 on 2017/11/18.
//  Copyright © 2017年 DD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

