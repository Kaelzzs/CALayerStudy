//
//  BezierView.h
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ShapType) {
    kTrangle,//三角形
    kRect,//矩形
    kCircle,//圆形
    kOval,//椭圆
    kTestShap,//测试demo
};

@interface BezierView : UIView

/**
 *  @author Kael
 *
 *  @brief 形状类型
 */
@property (nonatomic,assign) ShapType shaper;


@end
