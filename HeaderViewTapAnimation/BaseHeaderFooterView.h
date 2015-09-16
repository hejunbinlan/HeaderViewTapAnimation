//
//  BaseHeaderFooterView.h
//  HeaderViewTapAnimation
//
//  Created by YouXianMing on 15/9/16.
//  Copyright (c) 2015年 ZiPeiYi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseHeaderFooterView;

@protocol BaseHeaderFooterViewDelegate <NSObject>

@required
- (void)tapEventWithHeaderFooterView:(BaseHeaderFooterView *)headerFooterView section:(NSInteger)section;

@end

@interface BaseHeaderFooterView : UITableViewHeaderFooterView {

@protected
    NSInteger  _section;
}

@property (nonatomic, weak) id <BaseHeaderFooterViewDelegate> delegate;

- (void)setup;

- (void)loadData:(id)data section:(NSInteger)section;

- (NSInteger)currentSection;

@end
