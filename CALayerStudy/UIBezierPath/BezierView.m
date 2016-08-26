//
//  BezierView.m
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    switch (_shaper) {
        case kTrangle:
        {
            [self drawTrangle:rect];
        }
            break;
        case kRect:
        {
            [self drawMyReact:rect];
        }
            break;
        case kCircle:
        {
            [self drawCircle:rect];
        }
            break;
        case kOval:
        {
            [self drawOval:rect];
        }
            break;
        case kTestShap:
        {
            [self pathTest:rect];
        }
            break;
            
        default:
            break;
    }
    
    
    
}



-(void)drawTrangle:(CGRect )rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)];
    
    // 最后的闭合线是可以通过调用closePath方法来自动生成的，也可以调用-addLineToPoint:方法来添加
    //  [path addLineToPoint:CGPointMake(20, 20)];
    
    [path closePath];
    
    // 设置线宽
    path.lineWidth = 1.5;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

-(void)drawMyReact:(CGRect )rect{
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) cornerRadius:10.0];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(20, 20)];

    
    path.lineWidth = 1.5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];


}

-(void)drawCircle:(CGRect )rect{

    // 传的是正方形，因此就可以绘制出圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, rect.size.height - 40, rect.size.height - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
    
}

-(void)drawOval:(CGRect )rect{

    // 传的是不是正方形，因此就可以绘制出椭圆圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 80, self.frame.size.height - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];

}

-(void)pathTest:(CGRect )rect{
    /*
     
     + (instancetype)bezierPath;// 初始化path对象
     + (instancetype)bezierPathWithRect:(CGRect)rect;//矩形path对象
     + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;//矩形内切曲线 或者叫做 椭圆
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
     cornerRadius:(CGFloat)cornerRadius;//圆角矩形
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
     byRoundingCorners:(UIRectCorner)corners
     cornerRadii:(CGSize)cornerRadii;//指定某一个角绘制成圆角
     + (instancetype)bezierPathWithArcCenter:(CGPoint)center
     radius:(CGFloat)radius
     startAngle:(CGFloat)startAngle
     endAngle:(CGFloat)endAngle
     clockwise:(BOOL)clockwise;
     //-------------------
     center: 弧线中心点的坐标
     radius: 弧线所在圆的半径
     startAngle: 弧线开始的角度值
     endAngle: 弧线结束的角度值
     clockwise: 是否顺时针画弧线
     //-------------------
     + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;//
     
     */
    
    
    CGFloat viewWidth = CGRectGetWidth(rect);
    CGFloat viewHeight = CGRectGetHeight(rect);
    CGFloat rightSpace = 15.;
    CGFloat topSpace = 10.;
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWidth-rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWidth-rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWidth, topSpace);
    CGPoint point5 = CGPointMake(viewWidth-rightSpace, topSpace+10.);
    CGPoint point6 = CGPointMake(viewWidth-rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    
    path.lineWidth = 2;//线宽
    [[UIColor lightGrayColor] set];//填充色
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    [path fill];//填充
    
    
    
    [path closePath];//闭合路径
    [path stroke];//连线 （绘制）
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
