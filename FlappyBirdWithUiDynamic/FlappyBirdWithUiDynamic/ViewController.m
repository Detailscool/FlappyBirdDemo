//
//  ViewController.m
//  FlappyBirdWithUiDynamic
//
//  Created by Detailscool on 16/1/17.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"
#import "MyView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,weak)MyScrollView * scrollView;

//@property (nonatomic,weak)UIPushBehavior * push;
//@property (nonatomic,strong)UIDynamicAnimator * animator;
@property (weak, nonatomic) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyScrollView * scrollView = [[MyScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(2832,self.view.bounds.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview: scrollView];
    
    MyView * bgView  = [[MyView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bgView];

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(offset) userInfo:nil repeats:YES];
    
}

- (void)offset{
    CGPoint curP = self.scrollView.contentOffset;
    curP.x += 10;
    [self.scrollView setContentOffset:curP animated:YES];;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{


}
@end
