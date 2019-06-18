//
//  TestViewController.m
//  TEST
//
//  Created by zhangjikuan on 2019/2/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "TestViewController.h"
#import "GCDAction.h"
#import "CustomView.h"
#import "GloableMacro.h"
#import <iToast/UIView+iToast.h>
#import <iToast/Instancefactory.h>
#import "CBGroupAndStreamView.h"
#import "GloableOperation.h"
#import "GCDOperation.h"
#import "OperationProtocol.h"
#import "CoreAnimationOperation.h"
#import "HanoiTowerOperation.h"
#import "DesignPatternOperation.h"
#import <ZJKBaseSDK/WCSDK.h>
#import "BezierOperation.h"
#import "SortOperationAction.h"
#import "GloableMacro.h"
#import "AutoReleasePoolOperation.h"
#import "TEST-Swift.h"

@interface TestViewController ()<CBGroupAndStreamDelegate>
@property (strong, nonatomic) CBGroupAndStreamView * menueView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) NSMutableArray *operationClasses;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
}

- (void) addSubViews {

    [self addOperationClass:[GloableOperation class]];
    [self addOperationClass:[GCDOperation class]];
    [self addOperationClass:[CoreAnimationOperation class]];
    [self addOperationClass:[HanoiTowerOperation class]];
    [self addOperationClass:[DesignPatternOperation class]];
    [self addOperationClass:[BezierOperation class]];
    [self addOperationClass:[SortOperationAction class]];
    [self addOperationClass:[AutoReleasePoolOperation class]];
    [self addOperationClass:[SwiftPro class]];
    [self.view addSubview:self.menueView];
}
#pragma mark - CBGroupAndStreamViewDelegate
- (void)cb_confirmReturnValue:(NSArray *)valueArr groupId:(NSArray *)groupIdArr{
    NSLog(@"valueArr = %@ \ngroupIdArr = %@",valueArr,groupIdArr);
}

- (void)cb_selectCurrentValueWith:(NSString *)value index:(NSInteger)index groupId:(NSInteger)groupId{
    NSLog(@"value = %@----index = %ld------groupId = %ld",value,index,groupId);
    id <OperationProtocol> operation = self.operationClasses[groupId];
    [operation operationTarget:self WithIndex:index];
}

#pragma mark  create operations

- (void) addOperationClass:(Class)class {
    id <OperationProtocol> protocol = [self createOperation:class];

    [self.titleArray addObject:protocol.operationTitle];

    [self.contentArray addObject:protocol.operations];

    [self.operationClasses addObject:protocol];
}

- (id <OperationProtocol> )createOperation:(Class)class {

    id <OperationProtocol> operation = [[class alloc] init];

    return operation;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark setter & getter
- (CBGroupAndStreamView *)menueView {
    if (!_menueView) {
        CBGroupAndStreamView * silde = [[CBGroupAndStreamView alloc] initWithFrame:
                                        CGRectMake(0, kNaviBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        silde.delegate = self;
        silde.radius = 10;
        silde.font = [UIFont systemFontOfSize:12];
        silde.titleTextFont = [UIFont systemFontOfSize:18];
        silde.selColor = [UIColor orangeColor];
        [silde setContentView:self.contentArray titleArr:self.titleArray];
        _menueView = silde;
    }
    return _menueView;
}

- (NSMutableArray *)operationClasses {
    if (!_operationClasses) {
        _operationClasses = [NSMutableArray array];
    }
    return _operationClasses;
}
- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
 }
- (NSMutableArray *)contentArray {
    if (!_contentArray) {
        _contentArray = [NSMutableArray array];
    }
    return _contentArray;
}

@end
