//
//  ViewController.m
//  YDCircleProgress
//
//  Created by 司亚冰 on 2017/5/17.
//  Copyright © 2017年 SP. All rights reserved.
//

#import "ViewController.h"
#import "YDCircleProgress.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YDCircleProgress *circleView = [[YDCircleProgress alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    circleView.progress = 88;
    [self.view addSubview:circleView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
