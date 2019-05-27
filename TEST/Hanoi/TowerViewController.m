//
//  TowerViewController.m
//  Hanoi
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 sweetkk. All rights reserved.
//

#import "TowerViewController.h"
#import "TowerView.h"
#import "DiskView.h"
#define WINDOW_WIDTH [UIScreen mainScreen].bounds.size.width
#define WINDOW_HEIGHT [UIScreen mainScreen].bounds.size.height

// block解决循环引用
#define WeakSelf   __typeof(&*self) __weak weakSelf = self;
#define StrongSelf __typeof(&*self) __strong strongSelf = weakSelf;

@interface TowerViewController ()
@property (nonatomic, strong) NSMutableArray *diskArray;
@property (nonatomic, strong) NSMutableArray *towerArray;
@property (nonatomic, assign) NSInteger moveCount; // 移动次数
@property (nonatomic, assign) BOOL firstShow; // 首次演示
@end

@implementation TowerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diskArray = [NSMutableArray array];
        _towerArray = [NSMutableArray array];
        _firstShow = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"汉诺塔演示";
    [self configUI];
    self.view.backgroundColor = [UIColor whiteColor];
    // 确定按钮
    UIButton *beginBtn = [[UIButton alloc] initWithFrame:CGRectMake((WINDOW_WIDTH-100)/2, 80, 100, 30)];
    [beginBtn setTitle:@"开始" forState:UIControlStateNormal];
    [beginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    beginBtn.backgroundColor = [UIColor darkGrayColor];
    beginBtn.layer.cornerRadius = 4;
    beginBtn.layer.masksToBounds = YES;
    beginBtn.tag = 1024;
    [beginBtn addTarget:self action:@selector(beginMove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginBtn];


}

- (void)configUI {
    [self addThreeTower];
    [self initWithDiskPut];
}

- (void)addThreeTower {
    [self addTower:@"A" index:0];
    [self addTower:@"B" index:1];
    [self addTower:@"C" index:2];
}

- (void)addTower:(NSString *)towerId index:(NSInteger)index {
    NSInteger height = (WINDOW_HEIGHT - 150)/3 - 30;

     TowerView *tower = [[TowerView alloc] initWithFrame:CGRectMake((WINDOW_WIDTH-250)/2, 130 + (height+30)*index, 250, height+5)];
    tower.diskNumber = 0;
    tower.towerId = towerId;
    [self.view addSubview:tower];
    [self.towerArray addObject:tower];
    UILabel *towerLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, tower.frame.origin.y + height + 5, WINDOW_WIDTH-24, 15)];
    towerLabel.text = towerId;
    if (index == 0) {
        tower.diskNumber = _diskNumber;
    }
    towerLabel.textColor = [UIColor darkGrayColor];
    towerLabel.textAlignment = NSTextAlignmentCenter;
    towerLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:towerLabel];
}

// 初始放置盘子
- (void)initWithDiskPut {
    NSInteger towerHeight = (WINDOW_HEIGHT - 150)/3 - 40;
    NSInteger diskHeight = towerHeight / self.diskNumber;// 盘子高度
    CGFloat baseWidth = WINDOW_WIDTH/_diskNumber - 10;
    // 依次放置盘子
    for (int i = 0; i < self.diskNumber; i++) {
        NSInteger diskWeight = baseWidth*self.diskNumber - baseWidth*i;// 盘子宽度
        
        // 自定义的盘子模型类
        DiskView *disk = [[DiskView alloc] initWithFrame:CGRectMake((WINDOW_WIDTH-diskWeight)/2, 140 + diskHeight*(self.diskNumber-i-1), diskWeight, diskHeight)];
        disk.backgroundColor = [UIColor yellowColor];
        disk.layer.borderColor = [[UIColor darkGrayColor] CGColor];
        disk.layer.borderWidth = 1;
        disk.index = self.diskNumber - i;
        [self.view addSubview:disk];
        [self.diskArray addObject:disk];
    }
}

// 开始移动
- (void)beginMove {
    self.moveCount = 0;
    if (_firstShow) {
        _firstShow = NO;
        [self hanoiMethod];
    }else {
        [self resetConfig];
    }
    
    //    NSLog(@">>移动了%ld次", self.moveCount);
}
- (void)hanoiMethod {
    WeakSelf
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{// 到分线程去处理算法
        StrongSelf
        if (strongSelf) {
            [strongSelf hanoiWithDisk:strongSelf.diskNumber towers:[strongSelf.towerArray objectAtIndex:0] :[strongSelf.towerArray objectAtIndex:1] :[strongSelf.towerArray objectAtIndex:2]];
        }
    });
}
- (void)resetConfig {
    [_towerArray removeAllObjects];
    [_diskArray removeAllObjects];
    for (UIView *view in self.view.subviews) {
        if (view.tag!=1024) {
            [view removeFromSuperview];
        }
    }
    [self configUI];
    [self hanoiMethod];
}

// 移动算法递归算法  递归算法之所以得以执行和栈有很大的关系 (核心算法)
- (void)hanoiWithDisk:(NSInteger)diskNumber towers:(TowerView *)towerA :(TowerView *)towerB :(TowerView *)towerC {
    if (diskNumber == 1) {// 只有一个盘子则直接从A塔移动到C塔
        [self move:1 from:towerA to:towerC];
    } else {
        [self hanoiWithDisk:diskNumber-1 towers:towerA :towerC :towerB];// 递归把A塔上编号1~diskNumber-1的盘子移动到B塔，C塔辅助
        
        [self move:diskNumber from:towerA to:towerC];// 把A塔上编号为diskNumber的盘子移动到C塔
        
        [self hanoiWithDisk:diskNumber-1 towers:towerB :towerA :towerC];// 递归把B塔上编号1~diskNumber-1的盘子移动到C塔，A塔辅助
        
    }
}

// 移动过程
- (void)move:(NSInteger)diskIndex from:(TowerView *)fromTower to:(TowerView *)toTower {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);// 初始化信号量为0
    
    NSLog(@"第%ld次移动：把%ld号盘从塔%@移动到塔%@", ++self.moveCount, diskIndex, fromTower.towerId, toTower.towerId);
    
    for (DiskView *disk in self.diskArray) {
        if (disk.index == diskIndex) {
            
            WeakSelf
            dispatch_async(dispatch_get_main_queue(), ^{// 切回主线程进行移动动画
                [UIView animateWithDuration:1.0 animations:^{
                    StrongSelf
                    if (strongSelf) {
                        // 改变盘子的位置
                        CGPoint diskCenter = disk.center;
                        NSInteger towerY = 10 + toTower.frame.origin.y;
                        NSInteger towerHeight = toTower.frame.size.height-15;
                        NSInteger diskHeight = towerHeight / strongSelf.diskNumber;// 每个盘子高度
                        NSInteger hasDiskHieght = diskHeight * toTower.diskNumber;// 已放置了的盘子高度
                        diskCenter.y = towerY + (towerHeight - hasDiskHieght) - diskHeight/2;
                        disk.center = diskCenter;
                    }
                    
                } completion:^(BOOL finished) {
                    if (finished) {// 动画完成
                        StrongSelf
                        if (strongSelf) {
                            // 改变fromTower的盘子数量
                            fromTower.diskNumber--;
                            
                            // 改变toTower的盘子数量
                            toTower.diskNumber++;
                            
                            dispatch_semaphore_signal(sema);// 增加信号量，结束等待
                        }
                    }
                }];
            });
            
            
            break;
        }
    }
    
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);// 信号量若没增加，则一直等待，直到动画完成
}

@end
