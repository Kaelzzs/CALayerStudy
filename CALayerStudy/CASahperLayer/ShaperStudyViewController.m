//
//  ShaperStudyViewController.m
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "ShaperStudyViewController.h"

@interface ShaperStudyViewController ()

@end



/*
 
 CAShapeLayer有着几点很重要:
 
 1. 它依附于一个给定的path,必须给与path,而且,即使path不完整也会自动首尾相接
 
 2. strokeStart以及strokeEnd代表着在这个path中所占用的百分比
 
 3. CAShapeLayer动画仅仅限于沿着边缘的动画效果,它实现不了填充效果
 
 */
@implementation ShaperStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_progressView setBackgroundColor:[UIColor lightGrayColor]];
    NSTimer *observer;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(observer) userInfo:nil repeats:YES];
    
    [self testDemo];
    
    // Do any additional setup after loading the view.
}

-(void)observer{
    if (_progressView.progressRate >= _progressView.stopRate) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _progressView.progressRate = 1.0;
        });
    }

}

-(void)testDemo{

    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:showView];
    showView.backgroundColor = [UIColor redColor];
    showView.alpha = 0.5;
    
    // 贝塞尔曲线(创建一个圆) 产生一个圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100 / 2.f, 100 / 2.f)
                                                        radius:100 / 2.f
                                                    startAngle:0
                                                      endAngle:M_PI * 2
                                                     clockwise:YES];
    
    // 创建一个shapeLayer 由路径生成一个layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = showView.bounds;                // 与showView的frame一致
    layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
    //******** 这行代码很重要！！！
    layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
    //********
    layer.lineWidth     = 4.0f;                           // 线条宽度
    layer.strokeStart   = 0.0f;//开始点
    layer.strokeEnd     = 0.1f;//结束点
    
    
    
    // 将layer添加进图层
    [showView.layer addSublayer:layer];
    
    
    // 3s后执行动画操作(直接赋值就能产生动画效果)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        layer.speed       = 0.1;
//        layer.strokeStart = 0.5;
//        layer.strokeEnd   = 0.9f;
//        layer.lineWidth   = 1.0f;
//    });
    
    // 给这个layer添加动画效果
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 9.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.1f];
    pathAnimation.toValue = [NSNumber numberWithFloat:0.99f];
    pathAnimation.autoreverses = YES;
    [layer addAnimation:pathAnimation forKey:nil];
    
    // 创建一个gradientLayer
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = showView.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor redColor] CGColor],
                              (id)[[UIColor yellowColor] CGColor], nil]];
    [gradientLayer setLocations:@[@0.5,@0.9,@1]];
    [gradientLayer setStartPoint:CGPointMake(0.5, 1)];
    [gradientLayer setEndPoint:CGPointMake(0.5, 0)];
    
//    [gradientLayer setMask:layer];
    
    
}


-(void)dealloc{
    [_circleView stopAnimation];
    [_progressView stopAnimation];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_circleView stopAnimation];
    [_progressView stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
