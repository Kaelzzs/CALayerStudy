//
//  CATransform3DViewController.m
//  CALayerStudy
//
//  Created by Kael on 16/8/20.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "CATransform3DViewController.h"

@interface CATransform3DViewController ()

@end
/*
 
 struct CATransform3D
 {
 CGFloat     m11（x缩放）,    m12（y切变）,      m13（旋转）,     m14（）;
 
 CGFloat     m21（x切变）,    m22（y缩放）,      m23（）,         m24（）;
 
 CGFloat     m31（旋转）,      m32（ ）,        m33（）,         m34（透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义）;
 
 CGFloat     m41（x平移）,     m42（y平移）,     m43（z平移）,     m44（）;
 };

 */


@implementation CATransform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGAffineTransform affineAniamtion = CGAffineTransformMake(1, 1, 1, 1, 1, 1);
    affineAniamtion = CGAffineTransformScale(affineAniamtion, 0.9, 0.9);
    affineAniamtion = CGAffineTransformIdentity;
    affineAniamtion = CGAffineTransformConcat(affineAniamtion, affineAniamtion);
    affineAniamtion = CGAffineTransformInvert(affineAniamtion);
    affineAniamtion = CGAffineTransformFromString(@"1,1,1,1,1,1");
//    affineAniamtion = cgaffinetra
//    affineAniamtion = CGAffineTransformRotate(affineAniamtion, <#CGFloat angle#>)

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self testAnimation];
//    });
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [_firstView addGestureRecognizer:tap];
//    _firstView.alpha = 0.8;
    
    [_firstView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"default-736h@3x"]]];
    
}


- (IBAction)animationAction:(id)sender {
    
    [self testAnimation];
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap{

    

}

-(void)testAnimation{

    [UIView animateWithDuration:1.25 animations:^{
        
        [_firstView.layer setTransform:[self flodAnimation]];

    }];

    

}


-(CATransform3D)firstTransform3d{
    
    CATransform3D transform = CATransform3DIdentity;
    
//    transform.m34 = -0.0005; // 透视效果
//    transform.m13 = -0.0005; // 透视效果
//    transform.m41 = -0.0005; //

    
//    transform = CATransform3DRotate(transform,(M_PI/6), 0, 0, 1);//旋转
//    transform = CATransform3DMakeScale(0.8, 1, 1);//缩放
    transform = CATransform3DMakeTranslation(1, -20, 1);//平移
//    transform = CATransform3DInvert(transform);//反效果

    return transform;
}

-(CATransform3D)secondTransform3d{
    //CATransform3DConcat 将两个动画 combine 在一起
    CATransform3D  transform = CATransform3DMakeTranslation(1.0, 0.5, 1.0);
    transform = CATransform3DMakeScale(1.0, 0.5, 1.0);
    transform = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
//    transform = CATransform3DMakeAffineTransform(CGAffineTransformMake);//返回一个 相同效果的 仿射变换
    transform.m34 = -1/2000;
    
    return transform;
}

-(CATransform3D)thirdTransform3d{
    CATransform3D transform = CATransform3DIdentity;
    
    return transform;
}

-(CATransform3D)fourthTransform3d{
    CATransform3D transform = CATransform3DIdentity;
    
    return transform;
}

-(CATransform3D)flodAnimation{
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = -1/1000.0;
    
    CGFloat angle = 20;
    CATransform3D rotateTransform = CATransform3DRotate(transform, M_PI*angle/180, 1, 0, 0);
    
    CATransform3D moveTransform = CATransform3DMakeAffineTransform(CGAffineTransformMakeTranslation(0, 10));
    
    CATransform3D concatTransform = CATransform3DConcat(rotateTransform, moveTransform);
    return concatTransform;
}

-(void)kaelAnimation:(UITapGestureRecognizer *)sender{

    // 获取手指偏移量
//    CGPoint transP = [sender translationInView:_containV];
//    // 初始化形变
//    CATransform3D transform3D = CATransform3DIdentity;
//    // 设置立体效果
//    transform3D.m34 = -1 / 1000.0;
//    // 计算折叠角度，因为需要逆时针旋转，所以取反
//    CGFloat angle = -transP.y / 200.0 * M_PI;
//    _topView.layer.transform = CATransform3DRotate(transform3D, angle, 1, 0, 0);

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
