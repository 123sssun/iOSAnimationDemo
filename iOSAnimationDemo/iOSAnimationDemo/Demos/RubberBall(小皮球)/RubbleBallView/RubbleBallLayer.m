//
//  RubbleBallLayer.m
//  iOSAnimationDemo
//
//  Created by  justinchou on 16/3/16.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "RubbleBallLayer.h"
#import <UIKit/UIKit.h>

#define outsideRectSize 100

/// 判断左/右移动结构体
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
/// @return 返回一个皮球（未形变）
- (instancetype)init{
    self = [super init];
    if (self) {
        //默认设置一个值，当前值=0.5为皮球未形变的样子
        self.lastProgress = 0.5;
    }
    return self;
}

/// 绘制皮球（4段弧 每段弧由3条贝塞尔曲线完成）以及关键坐标点
- (void)drawInContext:(CGContextRef)ctx{
    /// AC1 BC2 BC3 CC4...两点之间的距离
    //当设置为正方形边长的1/3.6倍时，画出来的圆弧完美贴合圆形
    CGFloat offset = self.outsideRect.size.width / 3.6;
}

/// 重写progress的setter方法，每当progress发生改变时就调用该方法
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    //判断左/右移
    if (progress <= 0.5){
        self.movePiont = POINT_B;
        NSLog(@"B动");
    } else {
        self.movePiont = POINT_D;
        NSLog(@"D动");
    }
    
    self.lastProgress = progress;

    /// 矩形的x位置
    CGFloat origion_x = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    /// 矩形的y位置
    CGFloat origion_y = self.position.y - outsideRectSize/2;
    //设置矩形绘制区域
    self.outsideRect = CGRectMake(origion_x, origion_y, outsideRectSize, outsideRectSize);
    
    //该方法和setNeedsLayout一样，都是异步执行 调用该方法会自动调用drawInContext
    //因此每当progress改变就能执行drawInContext来重新绘制皮球
    [self setNeedsDisplay];
}

@end
