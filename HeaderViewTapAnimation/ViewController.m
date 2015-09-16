//
//  ViewController.m
//  HeaderViewTapAnimation
//
//  Created by YouXianMing on 15/9/16.
//  Copyright (c) 2015年 ZiPeiYi. All rights reserved.
//

#import "ViewController.h"
#import "ClassModel.h"
#import "StudentInfoCell.h"
#import "ClassHeaderView.h"

static NSString *infoCellFlag = @"BaseTableViewCell";
static NSString *infoHeadFlag = @"ClassHeaderView";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, BaseHeaderFooterViewDelegate>

@property (nonatomic, strong) NSMutableArray *classModels;
@property (nonatomic, strong) UITableView    *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createDatas];
    
    self.tableView = [self createTableViewWithDelegate:self frame:self.view.bounds];
    [self.view addSubview:self.tableView];
}

#pragma mark - 数据源相关
- (void)createDatas {
    
    NSArray *datas = @[@{@"className" : @"Aitna",
                         @"students"  : @[@{@"name" : @"Y.X.M.",   @"age" : @(27)},
                                          @{@"name" : @"Leif",     @"age" : @(12)},
                                          @{@"name" : @"Lennon",   @"age" : @(23)},
                                          @{@"name" : @"Lambert",  @"age" : @(19)},
                                          @{@"name" : @"Jerome",   @"age" : @(19)},
                                          @{@"name" : @"Isidore",  @"age" : @(19)}]},
                       @{@"className" : @"Melete",
                         @"students"  : @[@{@"name" : @"Merle",    @"age" : @(34)},
                                          @{@"name" : @"Paddy",    @"age" : @(31)},
                                          @{@"name" : @"Perry",    @"age" : @(10)},
                                          @{@"name" : @"Philip",   @"age" : @(39)}]},
                       @{@"className" : @"Aoede",
                         @"students"  : @[@{@"name" : @"Verne",    @"age" : @(34)},
                                          @{@"name" : @"Vincent",  @"age" : @(78)},
                                          @{@"name" : @"Walter",   @"age" : @(43)},
                                          @{@"name" : @"Zachary",  @"age" : @(21)}]},
                       @{@"className" : @"Dione",
                         @"students"  : @[@{@"name" : @"Timothy",  @"age" : @(98)},
                                          @{@"name" : @"Roderick", @"age" : @(21)},
                                          @{@"name" : @"Quentin",  @"age" : @(7)},
                                          @{@"name" : @"Paddy",    @"age" : @(67)}]},
                       @{@"className" : @"Adanos",
                         @"students"  : @[@{@"name" : @"Mortimer", @"age" : @(23)},
                                          @{@"name" : @"Michael",  @"age" : @(45)},
                                          @{@"name" : @"Kevin",    @"age" : @(89)},
                                          @{@"name" : @"Jeremy",   @"age" : @(23)}]},];
    
    self.classModels = [[NSMutableArray alloc] init];
    for (int count = 0; count < datas.count; count++) {
        
        ClassModel *classModel = [[ClassModel alloc] initWithDictionary:datas[count]];
        classModel.expend      = YES;
        
        [self.classModels addObject:classModel];
    }
}

#pragma mark - tableView相关
- (UITableView *)createTableViewWithDelegate:(id)delegate frame:(CGRect)frame {
    
    UITableView *tableView   = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate       = delegate;
    tableView.dataSource     = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator   = NO;
    
    [tableView registerClass:[StudentInfoCell class] forCellReuseIdentifier:infoCellFlag];
    [tableView registerClass:[ClassHeaderView class] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    
    return tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ClassModel *model = _classModels[section];
    
    if (model.expend == YES) {
        
        return [model.students count];
        
    } else {
    
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [_classModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellFlag];
    
    ClassModel   *classModel   = _classModels[indexPath.section];
    StudentModel *studentModel = classModel.students[indexPath.row];
    [cell loadData:studentModel indexPath:indexPath];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ClassHeaderView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:infoHeadFlag];
    titleView.delegate         = self;
    [titleView loadData:_classModels[section] section:section];
    
    ClassModel *model = _classModels[section];
    if (model.expend == YES) {
        
        [titleView extendStateAnimated:NO];
        
    } else {
        
        [titleView normalStateAnimated:NO];
    }
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 30;
}

- (void)tapEventWithHeaderFooterView:(BaseHeaderFooterView *)headerFooterView section:(NSInteger)section {
    
    ClassHeaderView *classHeaderView = (ClassHeaderView *)headerFooterView;
    
    ClassModel *model = _classModels[section];
    if (model.expend == YES) {
        
        // 缩回去
        model.expend = NO;
        [classHeaderView normalStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < model.students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    } else {
        
        // 显示出来
        model.expend = YES;
        [classHeaderView extendStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < model.students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
