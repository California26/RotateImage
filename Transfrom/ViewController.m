//
//  ViewController.m
//  Transfrom
//
//  Created by zcsing on 16/7/6.
//  Copyright © 2016年 chenLiwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    UIImageView *picView;
    BOOL menuisShowOrNot;
    CABasicAnimation *animation;
}
@end

@implementation ViewController
{
    CGFloat angle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    angle = 0;//更改图片的角度
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200,200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    picView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 100,100)];
    picView.image = [UIImage imageNamed:@"playIcon2@3x.jpg"];
    [view addSubview:picView];
    picView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImage:)];
    [picView addGestureRecognizer:tap];
     animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
}


- (void)selectImage:(UITapGestureRecognizer *)sender
{
    if (menuisShowOrNot) {
        menuisShowOrNot = NO;
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
        angle = 0;
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];

    }else{
        menuisShowOrNot = YES;
        angle = M_PI/2;
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        //围绕z轴旋转，垂直与屏幕
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)];
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
