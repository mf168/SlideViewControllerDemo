//
//  WFFLeftViewController.m
//  WFFSlideDemo
//
//  Created by wff on 15/8/16.
//  Copyright (c) 2015年 hct. All rights reserved.
//

#import "WFFLeftViewController.h"
#import "UIImage+WFFBlur.h"
#import "UIView+WFFGeneral.h"
#import "AppDelegate.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface WFFLeftViewController ()
{
    UIView          *_contentView;
    UIImageView     *_blurImageView;
}
@end

@implementation WFFLeftViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    _contentView = [[UIView alloc]initWithFrame:self.view.bounds];
    _contentView.backgroundColor = [UIColor blackColor];
    [_contentView setTarget:self action:@selector(hideView)];
    [self.view addSubview:_contentView];
    
    _blurImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 80, CGRectGetHeight(self.view.frame))];
    [self.view addSubview:_blurImageView];
}

#pragma mark 显示
- (void)showInView:(UIView *)view{
    AppDelegate *app = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    UIImage *screen = [app.navigationController.view capture];

    UIImage *blur = [screen blurredImageWithRadius:25.0f iterations:10 tintColor:nil];
    [view addSubview:self.view];
    
    _blurImageView.image    = blur;
    _contentView.alpha      = 0;
    
    [UIView animateWithDuration:0.3f animations:^{
        _blurImageView.x    = 0;
        _contentView.alpha  = 0.35f;
    }];
}

#pragma mark 隐藏
- (void)hideView{
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.alpha  = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

@end
