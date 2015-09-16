//
//  BaseTableViewCell.m
//  TextCapital
//
//  Created by YouXianMing on 15/7/1.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self defaultSetup];
        
        [self setup];
    }
    
    return self;
}

- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath {
        
}

- (void)defaultSetup {

    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setup {

}

@end
