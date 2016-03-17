//
//  JumpStarView.m
//  iOSAnimationDemo
//
//  Created by pb on 16/3/17.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "JumpStarView.h"

#define jumpDuration 0.125
#define downDuration 0.215
@implementation JumpStarView {
    UIImageView *_starView;
    UIImageView *_shadowView;
    BOOL _isAnimating;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
// MARK: - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_starView == nil) {
        _starView = [[UIImageView alloc] init];
        
        CGFloat starWidth = self.bounds.size.width - 10;
        CGFloat starHeight = starWidth;
        CGFloat starX = (self.bounds.size.width - starWidth) * 0.5;
        CGFloat starY = 0;
        
        _starView.frame = CGRectMake(starX, starY, starWidth, starHeight);
        
        _starView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_starView];
    }
    
    if (_shadowView == nil) {
        _shadowView = [[UIImageView alloc] init];
        CGFloat shadowWidth = 10;
        CGFloat shadowHeight = 3;
        CGFloat shadowX = (self.bounds.size.width - shadowWidth) * 0.5;
        CGFloat shadowY = self.bounds.size.height - 3;
        
        _shadowView.frame = CGRectMake(shadowX, shadowY, shadowWidth, shadowHeight);
        _shadowView.image = [UIImage imageNamed:@"shadow"];
        _shadowView.alpha = 0.4;
        [self addSubview:_shadowView];
    }
}
// MARK: - 上弹动画效果
- (void)jump {
}

@end
