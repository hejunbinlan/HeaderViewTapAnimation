//
//  ClassHeaderView.h
//  HeaderViewTapAnimation
//
//  Created by YouXianMing on 15/9/16.
//  Copyright (c) 2015年 ZiPeiYi. All rights reserved.
//

#import "BaseHeaderFooterView.h"
#import "RotateView.h"

@interface ClassHeaderView : BaseHeaderFooterView

/**
 *  正常状态
 */
- (void)normalStateAnimated:(BOOL)animated;

/**
 *  展开状态
 */
- (void)extendStateAnimated:(BOOL)animated;

@end
