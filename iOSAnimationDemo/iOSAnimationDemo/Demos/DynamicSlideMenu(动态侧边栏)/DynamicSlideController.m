//
//  DynamicSlideController.m
//  iOSAnimationDemo
//
//  Created by Mekingo8 on 16/3/16.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "DynamicSlideController.h"

@interface DynamicSlideController ()

@end

@implementation DynamicSlideController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat x = random() % 224 + 1.0;
    self.view.backgroundColor = [UIColor colorWithRed:x / 255.0 green:x / 255.0 blue:x / 255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
