//
//  MyView.m
//  FlappyBirdWithUiDynamic
//
//  Created by Detailscool on 16/1/18.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyView.h"
#import "MyImage.h"
@interface MyView()

@property (nonatomic,weak)UILabel * score;
@property (weak, nonatomic) UIView *redView;
@property (nonatomic,weak)UIPushBehavior * push;
@property (nonatomic,strong)UIDynamicAnimator * animator;
@property (nonatomic,weak) MyImage * collisionImg;

@property (nonatomic,strong)NSMutableArray * images;
@property (nonatomic,strong)NSMutableArray * deletedImages;
@end

@implementation MyView
static int count = 0;
static int collisionNum = 0;

- (void)drawRect:(CGRect)rect {
    if (!self.images.count) {
        return;
    }
    
    for (int i = 0; i < self.images.count; i++) {
        
        MyImage * img = self.images[i];
        
        [img drawAtPoint:CGPointMake(img.x, img.y)];
        
        img.x -= 4;
        
        if (img.x + img.size.width < 0) {
            [self.deletedImages addObject:img];
            count = 0;
        }
        
        if (self.collisionImg!= img && CGRectIntersectsRect(CGRectMake(img.x, img.y, img.size.width, img.size.height), self.redView.frame)) {
            self.collisionImg = img;
            collisionNum ++;
            self.score.text = [NSString stringWithFormat:@"你碰到了%d次",collisionNum];
        }
        
    
    }
    
    for (MyImage * img  in self.deletedImages) {
        [self.images removeObject:img];
    }
    [self.deletedImages removeAllObjects];
}



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (void)setup{
    
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 40, 40)];
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    [self addSubview:redView];
    
    UIGravityBehavior * gravity = [[UIGravityBehavior alloc]initWithItems:@[self.redView]];
    [self.animator addBehavior:gravity];
    
    UICollisionBehavior * collision = [[UICollisionBehavior alloc]initWithItems:@[self.redView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
    UIDynamicItemBehavior * item = [[UIDynamicItemBehavior alloc]initWithItems:@[self.redView]];
    item.density = 1.2;
    [self.animator addBehavior:item];
    
    UILabel * score = [[UILabel alloc]initWithFrame:CGRectMake(600, 10, 200, 20)];
    self.score = score;
    [self addSubview:score];
    
    CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(loopPlay)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIPushBehavior * push = [[UIPushBehavior alloc]initWithItems:@[self.redView] mode:UIPushBehaviorModeInstantaneous];
    self.push = push;
    push.pushDirection = CGVectorMake(0, -1);
    push.magnitude = 1;
    [self.animator addBehavior:push];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.animator removeBehavior:self.push];
}


- (void)loopPlay{
    
    if (self.images.count < 7) {
        
        NSString * path = [[NSBundle mainBundle]pathForResource:@"1.png" ofType:nil];
        
        MyImage * img = [[MyImage alloc]initWithContentsOfFile:path];
        
        img.position = arc4random_uniform(2);
    
        NSInteger randomNUM = arc4random_uniform(100);
        
        if (img.position == MyImageUp) {
            img.y =  0 - randomNUM;
        }else if(img.position == MyImageDown){
            img.y = self.bounds.size.height - img.size.height+ randomNUM;
        
        }
        
        img.x = self.bounds.size.width + count*100;
        count++;
        
        [self.images addObject:img];
    }
    
    [self setNeedsDisplay];
}

#pragma mark - *****************懒加载*****************

- (NSMutableArray *)deletedImages{
    if (!_deletedImages) {
        _deletedImages = [NSMutableArray array];
    }
    return _deletedImages;
}



-(NSMutableArray *)images{
    if (!_images) {
        _images = [[NSMutableArray alloc]init];
    }
    return _images;
}


-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
    }
    return _animator;
}

@end
