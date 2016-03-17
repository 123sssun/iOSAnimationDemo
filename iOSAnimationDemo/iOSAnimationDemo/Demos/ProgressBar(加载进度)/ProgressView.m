//
//  ProgressView.m
//  iOSAnimationDemo
//
//  Created by 付晓奎 on 16/3/17.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView{
    //    进度条宽高
    CGFloat _progressWidth;
    CGFloat _progressHeight;
    //    纪录原来视图frame
    CGRect _originframe;
    //    动画是否在进行
    BOOL _animating;
    
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //        初始化
        _animating = NO;
        _progressWidth = 200.0f;
        _progressHeight = 30.0f;
    }
    return self;
    
}

@end
