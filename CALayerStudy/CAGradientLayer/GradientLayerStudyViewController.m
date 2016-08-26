//
//  GradientLayerStudyViewController.m
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "GradientLayerStudyViewController.h"

#import "HJCornerRadius.h"
#import "UIImageView+ZSCornerRadius.h"
#import "UIView+CircleRadius.h"
#import <objc/runtime.h>
@interface GradientLayerStudyViewController ()

@end

@implementation GradientLayerStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bImageview.image = [UIImage imageNamed:@"ic_launcher"];
//    _bImageview.zs_CornerRadius = 200;
    NSString *urlStr = @"http://imgsrc.baidu.com/forum/abpic/item/9d096b63f6246b602f307c7ee3f81a4c510fa2fa.jpg";
    urlStr = @"https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg";
    urlStr = @"http://imgsrc.baidu.com/forum/pic/item/960a304e251f95ca57d98d0ec1177f3e6709525d.jpg";
    urlStr = @"http://imgsrc.baidu.com/forum/abpic/item/722c8e82b9014a90eeca060da1773912b21bee41.jpg";
    urlStr = @"http://imgsrc.baidu.com/forum/abpic/item/92fad788d43f8794de823368da1b0ef41ad53ab1.jpg";
    urlStr = @"https://adscdn.baidu.com/baichuan/adp_feed_admin/image/201608221813258601.jpg";
//    urlStr = @"https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg";
    [_bImageview zs_loadImageUrlStr:urlStr radius:100.0];
    
    
}
-(void)sayHello{
    //    _bImageview.layer.contents = (__bridge id)image.CGImage;
    //    _bImageview.backgroundColor = [UIColor orangeColor];
    //    _bImageview.layer.contentsGravity = kCAGravityCenter;
    
    //    _bImageview.zs_CornerRadius = 200.0f;
    //    _bImageview.aliCornerRadius = 200.0f;
    //    _bImageview.layer.masksToBounds = YES;
    
    //--------
    //    _bImageview.layer.shadowColor = [[UIColor redColor] CGColor];
    //    _bImageview.layer.shadowOffset =  CGSizeMake(0.0f, 5.0f);
    //    _bImageview.layer.shadowRadius = 10;
    //    CGMutablePathRef circlePath = CGPathCreateMutable();
    //    _bImageview.layer.shadowPath = [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)] CGPath];
    //    _bImageview.layer.shadowPath = circlePath;
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(10, 10)];
    
    //    _bImageview.layer.contentsGravity = kCAGravityResizeAspectFill;
    //    _bImageview.layer.contentsGravity = kCAGravityResize;
    //    _bImageview.layer.contentsScale = [UIScreen mainScreen].scale;//@1x  @2x @3x
    
    //    _bImageview.layer.masksToBounds = YES;//这相当于 UIView的 clipsToBounds 属性
    //    _bImageview.clipsToBounds = YES;
    
    //    _bImageview.layer.cornerRadius = 20.0;
    //    _bImageview.aliCornerRadius = 20.0;
    //    _bImageview.layer.masksToBounds = NO;
    
    
    //    CAShapeLayer *blueLayer = [CAShapeLayer layer];
    //    blueLayer.frame = CGRectMake(0, 0, _bImageview.frame.size.width, _bImageview.frame.size.height);
    //    blueLayer.fillColor = [UIColor blueColor].CGColor;
    //    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:
    //                      CGRectMake(0, 0, _bImageview.frame.size.width, _bImageview.frame.size.height) cornerRadius:20].CGPath;
    //    [_bImageview.layer setMask:blueLayer];
    
    //    [_bImageview setMyCornerRadius:100 andFillColor:[UIColor redColor] andLineWidth:5.0];
    
    //    CGRect rect = CGRectMake(50, 50, _bImageview.frame.size.width, _bImageview.frame.size.height);
    //    CGRect rect = CGRectMake(50, 50, 100, 100);
    //
    //    CAShapeLayer *blueLayer = [CAShapeLayer layer];
    //    blueLayer.frame = rect;
    //    blueLayer.fillColor = [UIColor clearColor].CGColor;
    //    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:
    //                      CGRectMake(0, 0, 100, 100) cornerRadius:20].CGPath;
    //    [_bImageview.layer setMask:blueLayer];
    
    //    Class cls = [UIView class];
    //    Method myCornerRadiusMethod = class_getInstanceMethod(cls, @selector(sayHello));
    //
    //    class_addMethod(cls, @selector(sayHello), method_getImplementation(myCornerRadiusMethod), method_getTypeEncoding(myCornerRadiusMethod));
    
    
    //    UIView *vv = [[UIView alloc] init];
    //    vv.zs_cornerRadius = @"";
    
    //    _bImageview.zs_cornerRadius = @"30";
    //
    //    _bImageview.layer.borderColor = [[UIColor greenColor] CGColor];
    //    _bImageview.layer.borderWidth = 5.0;
    
    //    [_bImageview setMyCornerRadius:30 andFillColor:[UIColor redColor] andLineWidth:100.0];
    
    //    [_bImageview setMyCornerRadius:200.0];
    

    NSLog(@"hello");
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
