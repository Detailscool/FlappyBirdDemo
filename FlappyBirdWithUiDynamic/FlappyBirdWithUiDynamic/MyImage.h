//
//  MyImage.h
//  FlappyBirdWithUiDynamic
//
//  Created by Detailscool on 16/1/18.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    
    MyImageUp,
    MyImageDown,
    
} MyImagePosition;

@interface MyImage : UIImage

@property (nonatomic,assign)CGFloat x;

@property (nonatomic,assign)CGFloat y;

@property (nonatomic,assign)MyImagePosition position;


@end
