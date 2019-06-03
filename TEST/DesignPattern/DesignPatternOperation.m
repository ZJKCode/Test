//
//  DesignPatternOperation.m
//  TEST
//
//  Created by zhangjikuan on 2019/5/27.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "DesignPatternOperation.h"
#import "CarBuild.h"
#import "CarDirect.h"
#import "DaCarCarBuild.h"
#import "XiaoCarCarBuild.h"
#import "PersonBuilder.h"
#import "PersonDirect.h"
#import "PersonFatBuilder.h"
#import "PersonThinBuilder.h"

@implementation DesignPatternOperation
- (NSString *)operationTitle {
    return @"设计模式";
}
- (NSArray<NSString *> *)operations {
    return @[@"策略模式",
             @"抽象工厂模式",
             @"代理模式",
//             @"工厂方法模式",
             @"观察者模式",
             @"简单工厂模式",
             @"建造者模式",
             @"模板方法模式",
             @"外观模式",
             @"原型模式",
             @"装饰模式",
             @"状态模式",
             @"组合模式",];
}

- (void)operationTarget:(id)target WithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            [self stateM];
            break;
        case 1:
            [self obstractFactoryM];
            break;
        case 2:
            [self delegateM];
            break;
        case 3:
            [self observerM];
            break;
        case 4:
            [self simleFactoryM];
            break;
        case 5:
            [self buldM];
            break;
        case 6:
            [self templateM];
            break;
        case 7:
            [self appearanceM];
            break;
        case 8:
            [self decorationM];
            break;
        case 9:
            [self stateM];
            break;
        case 10:
            [self combinationM];
            break;
        case 11:
            break;
        case 12:
            break;
        default:
            break;
    }
}

- (void)strategyM{

}
- (void)obstractFactoryM {

}

- (void)delegateM {

}

- (void)observerM {

}

- (void)simleFactoryM {

}

- (void)buldM {
    // 建造者模式
    // 分为两种角色 指导者，和建造者

    id <CarBuild> builder  = [[DaCarCarBuild alloc] init];
    CarDirect *direct = [[CarDirect alloc] initWithCarBuilder:builder];
    [direct createCar];

    id <PersonBuilder> pBuilder = [[PersonThinBuilder alloc] init];
    PersonDirect *pDirect = [[PersonDirect alloc] initWithPerson:pBuilder];
    [pDirect createPerson];


}

- (void)templateM {

}

- (void)appearanceM {

}

- (void)prototypeM {

}

- (void)decorationM {

}

- (void)stateM {

}

- (void)combinationM {

}

@end
