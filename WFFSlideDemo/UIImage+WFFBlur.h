//
//  UIImage+WFFBlur.h
//  WFFSlideDemo
//
//  Created by wff on 15/8/16.
//  Copyright (c) 2015年 hct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WFFBlur)

/*高斯模糊*/
- (UIImage *)blurredImageWithRadius:(CGFloat)radius
                         iterations:(NSUInteger)iterations
                          tintColor:(UIColor *)tintColor;

@end
