//
//  BaseTableViewCell.h
//  TextCapital
//
//  Created by YouXianMing on 15/7/1.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"

@interface BaseTableViewCell : UITableViewCell

- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath;
- (void)defaultSetup;
- (void)setup;

@end
