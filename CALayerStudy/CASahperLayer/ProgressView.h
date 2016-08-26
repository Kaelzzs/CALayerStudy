//
//  ProgressView.h
//  CALayerStudy
//
//  Created by Kael on 16/8/16.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>



//#define kLine_width 5.0
//#define kProgressStep 0.05
//#define kTimeStep 0.05

@interface ProgressView : UIView


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
 *  @brief 进度比率
 */
@property (nonatomic,assign) CGFloat progressRate;

/**
 *  @author Kael
 *
 *  @brief 是否继续
 */
@property (nonatomic,assign) BOOL isGotoEnd;

/**
 *  @author Kael
 *
 *  @brief 时间步进值
 */
@property (nonatomic,assign) CGFloat timeStep;

/**
 *  @author Kael
 *
 *  @brief 线宽
 */
@property (nonatomic,assign) CGFloat line_width;

/**
 *  @author Kael
 *
 *  @brief 进度条的步进值
 */
@property (nonatomic,assign) CGFloat progressStep;

/**
 *  @author Kael
 *
 *  @brief 进度条暂停点（模拟卡顿效果);取值范围:0-1(默认:0.75)
 */
@property (nonatomic,assign) CGFloat stopRate;


/**
 *  @author Kael
 *
 *  @brief 停止动画
 */
-(void)stopAnimation;


@end
