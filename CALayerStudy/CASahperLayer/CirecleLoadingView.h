//
//  CirecleLoadingView.h
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kLine_width 2.0
#define kProgressStep 0.1
#define kTimeStep 0.1

@interface CirecleLoadingView : UIView



/**
 *  @author Kael
 *
 *  @brief 贝塞尔路径
 */
@property (nonatomic,strong) UIBezierPath *bezierPath;

/**
 *  @author Kael
 *
 *  @brief 形状图层
 */
@property (nonatomic,strong) CAShapeLayer *shaperLayer;

/**
 *  @author Kael
 *
 *  @brief 过渡（渐变）色图层
 */
@property (nonatomic,strong) CAGradientLayer *gradientLayer;

/**
 *  @author Kael
 *
 *  @brief 动画定时器
 */
@property (nonatomic,strong) NSTimer *animationTimer;

/**
 *  @author Kael
 *
 *  @brief 停止动画
 */
-(void)stopAnimation;

@end
