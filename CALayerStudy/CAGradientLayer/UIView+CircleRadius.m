//
//  UIView+CircleRadius.m
//  CALayerStudy
//
//  Created by Kael on 16/8/22.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "UIView+CircleRadius.h"
#import <objc/runtime.h>


static NSString *kCornerRadius = NULL;
@implementation UIView (CircleRadius)

-(void)setZs_cornerRadius:(NSString *)zs_cornerRadius{
    objc_setAssociatedObject(self, &kCornerRadius, zs_cornerRadius, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setMyCornerRadius:[zs_cornerRadius floatValue]];
}

- (NSString *)zs_cornerRadius {
    return objc_getAssociatedObject(self, &kCornerRadius);
}


+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIView class];
        
        SEL originalSelector = @selector(willMoveToSuperview:);
        SEL swizziledSelector = @selector(mywillMoveToSuperview:);
        
        Method originalMethod = class_getInstanceMethod(cls, originalSelector);
        Method swizziledMethod = class_getInstanceMethod(cls, swizziledSelector);
        
        BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizziledMethod), method_getTypeEncoding(swizziledMethod));
        
        if (didAddMethod) {
        
            class_replaceMethod(cls, swizziledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
        }else{
        
            method_exchangeImplementations(originalMethod, swizziledMethod);
            
            
            Method myCornerRadiusMethod = class_getInstanceMethod(cls, @selector(setMyCornerRadius:));
            
            class_addMethod(cls, @selector(setMyCornerRadius:), method_getImplementation(myCornerRadiusMethod), method_getTypeEncoding(myCornerRadiusMethod));

            
        }
        
    });
    
    
}

-(void)changeClass:(Class)cls OriginalSelector:(SEL)originalSelctor withSwizziledSelector:(SEL)swizziledSelector{


}

-(void)setMyCornerRadius:(CGFloat)radius{

    CAShapeLayer *radiusLayer = [CAShapeLayer layer];
    radiusLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    radiusLayer.fillColor = [UIColor blueColor].CGColor;
    radiusLayer.path = [UIBezierPath bezierPathWithRoundedRect:
                      CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:radius].CGPath;
    [self.layer setMask:radiusLayer];
}

-(void)setMyCornerRadius:(CGFloat)radius andFillColor:(UIColor *)fillColor andLineWidth:(CGFloat)lineWidth{
    //******
    UIBezierPath *bPath;
    bPath = [UIBezierPath bezierPathWithRoundedRect:
                           CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:radius];
    bPath.lineWidth = lineWidth;
    //******
    CAShapeLayer *radiusLayer = [CAShapeLayer layer];
    radiusLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    radiusLayer.path = bPath.CGPath;

    //------
    radiusLayer.strokeColor = [[UIColor greenColor] CGColor];
    //------
    
    //******
    [self.layer setMask:radiusLayer];
}
-(void)mywillMoveToSuperview:(UIView *)view{
    [self mywillMoveToSuperview:view];
    if (view!=nil) {

    }

}




@end
