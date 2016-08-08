//
//  YHImage.h
//  YHFlappyBird
//
//  Created by Detailscool on 16/1/18.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, YHImagePosition){
    YHImageUp,
    YHImageDown,
};

@interface YHImage : UIImage
@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)YHImagePosition position;
@end
