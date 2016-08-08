//
//  ViewController.m
//  YHFlappyBird
//
//  Created by HenryLee on 16/8/8.
//  Copyright © 2016年 HenryLee. All rights reserved.
//

#import "ViewController.h"
#import "YHGameView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YHGameView * gameView = [[YHGameView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:gameView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
