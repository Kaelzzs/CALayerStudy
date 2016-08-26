//
//  CirecleLoadingView.m
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "CirecleLoadingView.h"

@implementation CirecleLoadingView




- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor orangeColor] set];

    //设置路径
    _bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(kLine_width, kLine_width, rect.size.width-kLine_width*2, rect.size.height-kLine_width*2)];
    _bezierPath.lineWidth = kLine_width;
    
    //绘制形状
    _shaperLayer = [CAShapeLayer layer];
    _shaperLayer.frame         = CGRectMake(0, 0, rect.size.width-kLine_width*2, rect.size.height-kLine_width*2);                // 与showView的frame一致
    _shaperLayer.strokeColor   = [UIColor orangeColor].CGColor;   // 边缘线的颜色
    _shaperLayer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    _shaperLayer.lineCap       = kCALineCapRound;               // 边缘线的类型
    //******** 这行代码很重要！！！
    _shaperLayer.path          = _bezierPath.CGPath;                    // 从贝塞尔曲线获取到形状
    //********
    _shaperLayer.lineWidth     = kLine_width;                           // 线条宽度
    _shaperLayer.strokeStart   = 0.000f;//开始点
    _shaperLayer.strokeEnd     = 0.000f;//结束点
    
//    [self.layer addSublayer:_shaperLayer];
    
    //填充过渡色
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    
    NSMutableArray *colors = [NSMutableArray array];
    //彩色
    for (int hue = 0; hue < 10; hue++) {
        [colors addObject:(id)[[UIColor colorWithHue:(0.1 * hue+0.01) saturation:1 brightness:0.8 alpha:1] CGColor]];
    }
    _gradientLayer.colors = colors;
    //起始点和结束点设置 能决定色彩渲染的方向
    _gradientLayer.startPoint = CGPointMake(0.0,1.0);
    _gradientLayer.endPoint = CGPointMake(1.0,1.0);
    [_gradientLayer setMask:_shaperLayer];
    
    [self.layer addSublayer:_gradientLayer];
    [self setTransform:CGAffineTransformRotate(self.transform, -M_PI_2)];
    [self startAnimation];
}

-(void)startAnimation{

    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:kTimeStep target:self selector:@selector(animationChange) userInfo:nil repeats:YES];
    
    return;
    [self changeStrokeEndWith:0.0 andEndValue:1.0 andDuration:4.0 completeBlock:^{
        
        _shaperLayer.strokeStart = 0.0;
        _shaperLayer.strokeEnd = 1.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self changeStrokeStartWith:0.0 andEndValue:1.0 andDuration:2.0 completeBlock:^{
                _shaperLayer.strokeStart = 0.0;
                _shaperLayer.strokeEnd = 0.0;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self startAnimation];
                });
            }];
            
        });

        
    }];

}

-(void)stopAnimation{
    if (_animationTimer) {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
}
-(void)animationChange{
    
    if (_shaperLayer.strokeStart < 1 && _shaperLayer.strokeEnd < 1) {
        _shaperLayer.strokeEnd += kProgressStep;
        if (_shaperLayer.strokeEnd > 1.0) {
            _shaperLayer.strokeEnd = 1.0;
        }
        NSLog(@"01 start:%f end:%f",_shaperLayer.strokeStart,_shaperLayer.strokeEnd);

    }else if (_shaperLayer.strokeEnd >= 1 && _shaperLayer.strokeStart < 1){
        _shaperLayer.strokeStart += kProgressStep;
        NSLog(@"02 start:%f end:%f",_shaperLayer.strokeStart,_shaperLayer.strokeEnd);

    }else if (_shaperLayer.strokeStart >= 1 && _shaperLayer.strokeEnd >= 1){
        _shaperLayer.strokeEnd = 0.0;
        _shaperLayer.strokeStart = 1.0;
        NSLog(@"03 start:%f end:%f",_shaperLayer.strokeStart,_shaperLayer.strokeEnd);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _shaperLayer.strokeStart = 0.0;
            _shaperLayer.strokeEnd = 0.0;
        });

    }
    
    
}


-(void)changeStrokeEndWith:(CGFloat)fromValue andEndValue:(CGFloat)endValue andDuration:(CGFloat)duration completeBlock: (void(^ )())completed{
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:fromValue];
    pathAnimation.toValue = [NSNumber numberWithFloat:endValue];
    pathAnimation.autoreverses = NO;
    [_shaperLayer addAnimation:pathAnimation forKey:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((duration-0.1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completed();
    });

}

-(void)changeStrokeStartWith:(CGFloat)fromValue andEndValue:(CGFloat)endValue andDuration:(CGFloat)duration completeBlock: (void(^ )())completed{
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:fromValue];
    pathAnimation.toValue = [NSNumber numberWithFloat:endValue];
    pathAnimation.autoreverses = NO;
    [_shaperLayer addAnimation:pathAnimation forKey:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((duration-0.1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completed();
    });
    
}

-(void)dealloc{
    [self stopAnimation];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
