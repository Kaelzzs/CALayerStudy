//
//  ProgressView.m
//  CALayerStudy
//
//  Created by Kael on 16/8/16.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

-(instancetype)init{

    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}
#pragma mark - 数据初始化
-(void)initData{
   
    _progressRate = 0;
    _isGotoEnd = NO;
    _timeStep = 0.05;
    _progressStep = 0.1;
    _line_width = 1.0;
    _stopRate = 0.75;
    
    if (_animationTimer) {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }

}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self initData];
    
    [self.backgroundColor set];
    CGFloat width = self.frame.size.width;
//-----------贝塞尔曲线路径
    _bezierPath = [UIBezierPath bezierPathWithRect:rect];
    _bezierPath.lineWidth = _line_width;
    [_bezierPath fill];
    [_bezierPath stroke];
//------------形状Layer
    _shaperLayer = [CAShapeLayer layer];
    _shaperLayer.frame = CGRectMake(-width, 0, width, rect.size.height);
    _shaperLayer.path = _bezierPath.CGPath;
    
    [self.layer setMask:_shaperLayer];
    [self startAnimation];
}

#pragma mark - 开始动画
-(void)startAnimation{
    _progressRate = 0;
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(progressValueChange) userInfo:nil repeats:YES];
}

-(void)progressValueChange{
    
    if (_stopRate >=1) {
        if (_progressRate < 1) {
            self.progressRate += 0.01;
        }
    }else{
        if (_progressRate <= _stopRate) {
            self.progressRate += 0.01;
            
        }
        else if (_progressRate >= 0.9){
            
        }
        else if (_progressRate<=0){
            
        }
    }

}


-(void)stopAnimation{
    if (_animationTimer) {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
}
#pragma mark - 设置动画的参数

#pragma mark ------->> 设置进度
-(void)setProgressRate:(CGFloat)progressRate{
    _progressRate = progressRate;
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat X = 0;
    if (_progressRate <= 1 && _progressRate >= 0) {
        //有效范围内才给shaperLayer赋值
        X = -(width * (1-_progressRate));
        _shaperLayer.frame = CGRectMake(X, 0, width, height);
    }if (_progressRate >= 1) {
        _shaperLayer.frame = CGRectMake(0, 0, width, height);
    }

}

#pragma mark ------->> 卡顿点

-(void)setStopRate:(CGFloat)stopRate{

    _stopRate = stopRate;
    
    if (_stopRate >=1) {
        _stopRate = 1;
        _isGotoEnd = YES;
    }

}

#pragma mark ------->>:备用 CoreAnimation
// -------------- 横向移动
-(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x andComplet:(void(^)() )completBlock
{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.removedOnCompletion=YES;
    
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount = FLT_MAX;
    animation.autoreverses = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completBlock();
    });
    return animation;
}

#pragma mark - 安全处理：
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
