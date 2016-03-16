//
//  MaskViewController.m
//  iOSAnimationDemo
//
//  Created by Mekingo8 on 16/3/16.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat x = random() % 214 + 1.0;
    self.view.backgroundColor = [UIColor colorWithRed:x / 255.0 green:x / 255.0 blue:x / 255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
