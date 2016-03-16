//
//  RubbleBallLayer.m
//  iOSAnimationDemo
//
//  Created by  justinchou on 16/3/16.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "RubbleBallLayer.h"
#import <UIKit/UIKit.h>

typedef enum {
    /// 皮球左侧点
    POINT_D,
    /// 皮球右侧点
    POINT_B
} MovePoint;

@interface RubbleBallLayer ()
/// 外接正方形范围，作为皮球的参考
@property (nonatomic, assign) CGRect outsideRect;
/// 记录上一次的形变程度(进度条数值)
@property (nonatomic, assign) CGFloat lastProgress;
/// 实时记录滑动的方向 (POINT_D左 POINT_B右)
@property (nonatomic, assign) MovePoint movePiont;
@end

@implementation RubbleBallLayer
/// 初始化方法
///
/// @return 画出一个皮球
- (instancetype)init{
    self = [super init];
    if (self) {
        //默认设置一个值，当前值=0.5为皮球未形变的样子
        self.lastProgress = 0.5;
    }
    return self;
}



@end
