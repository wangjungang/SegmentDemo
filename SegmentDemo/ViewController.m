//
//  ViewController.m
//  SegmentDemo
//
//  Created by 王俊钢 on 2017/7/1.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "LLSegmentBarVC.h"
#import "oneViewController.h"



@interface ViewController ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;
@end

@implementation ViewController

// lazy init
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, 320, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    
    
    NSArray *items = @[@"推荐", @"全部", @"神贴"];
    oneViewController *vc1 = [oneViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[vc1,vc2,vc3]];
    
    
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor blackColor]).itemSelectColor([UIColor redColor]).indicatorColor([UIColor greenColor]);
    }];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
