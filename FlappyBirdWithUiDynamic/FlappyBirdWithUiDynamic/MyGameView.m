//
//  MyGameView.m
//  FlappyBirdWithUiDynamic
//
//  Created by HenryLee on 16/8/8.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyGameView.h"
#import "MyView.h"

@interface MyGameView()

@property (nonatomic,weak)UIScrollView * scrollView;

@end

@implementation MyGameView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIImage * img = [UIImage imageNamed:@"520_userguid_bg"];
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    scrollView.contentSize = CGSizeMake(img.size.width,self.bounds.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview: scrollView];
    self.scrollView = scrollView;
    
    UIImageView * imgView = [[UIImageView alloc]init];
    imgView.image = img;
    imgView.frame = CGRectMake(0, 0, img.size.width, self.bounds.size.height);
    [scrollView addSubview:imgView];
    
    MyView * bgView  = [[MyView alloc]initWithFrame:self.bounds];
    [self addSubview:bgView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(offset) userInfo:nil repeats:YES];
}

- (void)offset{
    CGPoint curP = self.scrollView.contentOffset;
    curP.x += 10;
    if (curP.x > self.scrollView.contentSize.width - self.scrollView.bounds.size.width) {
        curP.x = 0;
        [self.scrollView setContentOffset:curP animated:NO];
        return;
    }
    
    [self.scrollView setContentOffset:curP animated:YES];
}

@end
