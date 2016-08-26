//
//  ShaperStudyViewController.h
//  CALayerStudy
//
//  Created by Kael on 16/8/15.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CirecleLoadingView.h"
#import "ProgressView.h"
@interface ShaperStudyViewController : UIViewController
@property (weak, nonatomic) IBOutlet CirecleLoadingView *circleView;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end
