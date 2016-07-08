//
//  ViewController.m
//  Transfrom
//
//  Created by zcsing on 16/7/6.
//  Copyright © 2016年 chenLiwei. All rights reserved.
//

#import "ViewController.h"


//以蓝色为标准
@interface ViewController ()

{
    UIImageView *picView;
    CABasicAnimation *animation;
    CGFloat angle;
    int changeStep;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    angle = 0;//更改图片的角度
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200,200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    picView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100,100)];
    picView.image = [UIImage imageNamed:@"rotate.jpg"];
    [view addSubview:picView];
    picView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImage:)];
    [picView addGestureRecognizer:tap];
     animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
}


- (void)selectImage:(UITapGestureRecognizer *)sender
{
    switch (changeStep) {
        case 0:
            angle = M_PI/2;
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            //围绕z轴旋转，垂直与屏幕
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            changeStep = 1;
            break;
        case 1:
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            angle = M_PI;
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            changeStep = 2;
            break;
            
        case 2:
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            angle = M_PI+M_PI_2;
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            changeStep = 3;
            break;
        case 3:
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            angle = M_PI*2;
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
            changeStep = 0;
            break;
        default:
            break;
    }
    animation.duration = 0.3;
    animation.repeatCount = 1;
    animation.cumulative = YES;
    [picView.layer addAnimation:animation forKey:nil];
    picView.transform = CGAffineTransformMakeRotation(angle);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
