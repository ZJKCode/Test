//
//  AppDelegate.m
//  TEST
//
//  Created by zhangjikuan on 2018/11/15.
//  Copyright © 2018 winchannel. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "GloableOperation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    printf("sizeof : int = %lu, long = %lu, long long = %lu\n", sizeof(int), sizeof(long), sizeof(long long));
    printf("sizeof: float = %lu, double = %lu, long double = %lu\n", sizeof(float), sizeof(double), sizeof(long double));
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TestViewController *view = [[TestViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)gloableOperation {
    GloableOperation *operation = [[GloableOperation alloc] init];

    [operation deal_OperationClass];
}
@end
