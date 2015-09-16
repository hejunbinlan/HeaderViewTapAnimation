//
//  BaseHeaderFooterView.m
//  HeaderViewTapAnimation
//
//  Created by YouXianMing on 15/9/16.
//  Copyright (c) 2015年 ZiPeiYi. All rights reserved.
//

#import "BaseHeaderFooterView.h"

@implementation BaseHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {

}

- (void)loadData:(id)data section:(NSInteger)section {

    _section = section;
}

- (NSInteger)currentSection {

    return _section;
}

@end
