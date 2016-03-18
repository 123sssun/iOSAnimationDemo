//
//  PullDownController.m
//  iOSAnimationDemo
//
//  Created by Mekingo8 on 16/3/16.
//  Copyright © 2016年 Mekingo8. All rights reserved.
//

#import "PullDownController.h"
#import "UIView+Convenient.h"
#import "KYPullToCurveVeiw.h"
#import "KYPullToCurveVeiw_footer.h"

#define initialOffset 50.0
#define targetHeight 500.0

static NSString * const reuseID = @"animationCurve";

@interface PullDownController ()<UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation PullDownController{
    UILabel *navTitle;
    UIView *bkView;
}

- (void)loadView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    self.view = tableView;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat x = random() % 254 + 1.0;
    self.view.backgroundColor = [UIColor colorWithRed:x / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0];
    
    bkView = [[UIView alloc]init];
    bkView.center = CGPointMake(self.view.center.x, 22);
    bkView.bounds = CGRectMake(0, 0, 250, 44);
    bkView.clipsToBounds = YES;
    [self.navigationController.navigationBar addSubview:bkView];
    
    navTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 44+initialOffset,bkView.frame.size.width, 44)];
    navTitle.alpha = 0;
    navTitle.textAlignment = NSTextAlignmentCenter;
    navTitle.textColor = [UIColor blackColor];
    navTitle.text = @"Fade in/out navbar title";
    [bkView addSubview:navTitle];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat transitionY = MIN(MAX(0, scrollView.contentOffset.y+64), 44+initialOffset+targetHeight);
    NSLog(@"%f",transitionY);
    if (transitionY <= initialOffset) {
        navTitle.frame = CGRectMake(0, 44+initialOffset-transitionY,bkView.frame.size.width , 44);
    }else{
        CGFloat factor = MAX(0, MIN(1, (transitionY-initialOffset)/targetHeight));
        navTitle.frame = CGRectMake(0, 44-factor*44,bkView.frame.size.width , 44);
        navTitle.alpha = factor*factor*1;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    KYPullToCurveVeiw *headerView = [[KYPullToCurveVeiw alloc]initWithAssociatedScrollView:self.tableView withNavigationBar:YES];
    
    __weak KYPullToCurveVeiw *weakHeaderView = headerView;
    
    [headerView triggerPulling];
    [headerView addRefreshingBlock:^{
        //具体的操作
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakHeaderView stopRefreshing];
        });
        
    }];
    
    KYPullToCurveVeiw_footer *footerView = [[KYPullToCurveVeiw_footer alloc]initWithAssociatedScrollView:self.tableView withNavigationBar:YES];
    
    __weak KYPullToCurveVeiw_footer *weakFooterView= footerView;
    
    [footerView addRefreshingBlock:^{
        //具体的操作
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [weakFooterView stopRefreshing];
            
        });
    }];
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *testCell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    testCell.textLabel.text = [NSString stringWithFormat:@"第%ld条", indexPath.row];
    return testCell;
}
@end
