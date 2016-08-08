//
//  ViewController.m
//  FlappyBirdWithUiDynamic
//
//  Created by Detailscool on 16/1/17.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "MyGameView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyGameView * gameView = [[MyGameView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:gameView];
}


@end
