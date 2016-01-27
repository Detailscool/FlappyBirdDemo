//
//  MyScrollView.m
//  FlappyBirdWithUiDynamic
//
//  Created by Detailscool on 16/1/17.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyScrollView.h"


@interface MyScrollView()



@end

@implementation MyScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * imgView = [[UIImageView alloc]init];
        UIImage * img = [UIImage imageNamed:@"520_userguid_bg"];
        imgView.image = img;
        imgView.frame = CGRectMake(0, 0, img.size.width, self.bounds.size.height);
        [self addSubview:imgView];
        
    }
    return self;
}




@end
