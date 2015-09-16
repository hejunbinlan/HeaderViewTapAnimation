//
//  RotateAnimationProtocol.h
//  RotateView
//
//  Created by YouXianMing on 15/7/31.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+RotateAnimationProtocol.h"

@protocol RotateAnimationProtocol <NSObject>

/**
 *  旋转到向上的位置（默认的位置）
 *
 *  @param animated 是否显示动画
 */
- (void)changeToUpAnimated:(BOOL)animated;

/**
 *  旋转到向左的位置
 *
 *  @param animated 是否显示动画
 */
- (void)changeToLeftAnimated:(BOOL)animated;

/**
 *  旋转到向右的位置
 *
 *  @param animated 是否显示动画
 */
- (void)changeToRightAnimated:(BOOL)animated;

/**
 *  旋转到向下的位置
 *
 *  @param animated 是否显示动画
 */
- (void)changeToDownAnimated:(BOOL)animated;


@end
