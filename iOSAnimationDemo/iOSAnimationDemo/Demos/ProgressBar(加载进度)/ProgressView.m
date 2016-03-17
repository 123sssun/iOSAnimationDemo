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
#pragma mark - 初试化
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //        初始化
        _animating = NO;
        _progressWidth = 200.0f;
        _progressHeight = 30.0f;
        
        // 轻触事件
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
        [self addGestureRecognizer:tap];
    }
    return self;
    
}
//轻触事件，变更视图为进度条视样式
-(void)tapped:(UITapGestureRecognizer *)tapped{
    
    //判断是否在正在尽享动画
    if (_animating == YES) {
        return;
    }
    //纪录原始的frame
    _originframe = self.frame;
    
    //    初始化
    //移除之前的所有动画
    for ( CALayer * subLayer in self.layer.sublayers) {
        [subLayer removeFromSuperlayer];
    }
    self.backgroundColor = [UIColor colorWithRed:0.0 green:122/255.0 blue:255/255.0 alpha:1.0];
    _animating = YES;
    //    圆角
    self.layer.cornerRadius = _progressHeight / 2;
    
    //动画
    CABasicAnimation *radiusAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    radiusAnimation.duration = 0.2f;
    radiusAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    radiusAnimation.fromValue = @(_originframe.size.height/2);
    radiusAnimation.delegate = self;
    [self.layer addAnimation:radiusAnimation forKey:@"cornerRadiusShrinkAnim"];
}
#pragma mark - 动画代理方法
//动画开始
-(void)animationDidStart:(CAAnimation *)anim{
    if([anim isEqual:[self.layer animationForKey:@"cornerRadiusShrinkAnim"]]){
        /**
         Duration : 时间
         delay ： 延时
         usingSpringWithDamping：弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
         initialSpringVelocity：弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
         options
         UIViewAnimationOptionCurveEaseInOut //时间曲线函数，由慢到快
         UIViewAnimationOptionCurveEaseIn //时间曲线函数，由慢到特别快
         UIViewAnimationOptionCurveEaseOut //时间曲线函数，由快到慢
         UIViewAnimationOptionCurveLinear //时间曲线函数，匀速
         */
        [UIView animateWithDuration:0.6f delay:0.0f usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.bounds = CGRectMake(0, 0, _progressWidth, _progressHeight);
        } completion:^(BOOL finished) {
            [self.layer removeAllAnimations];
        }];
        
    }

}
@end
