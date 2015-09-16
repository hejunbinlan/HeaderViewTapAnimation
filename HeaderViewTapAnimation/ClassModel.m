//
//  ClassModel.m
//
//  http://www.cnblogs.com/YouXianMing/
//  https://github.com/YouXianMing
//
//  Copyright (c) YouXianMing All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    // 过滤NSNull值
    if ([value isKindOfClass:[NSNull class]]) {
        
        return;
    }
    
    // 属性为数组时(数组中的所有元素都为相同类型的对象)
    if ([key isEqualToString:@"students"] && [value isKindOfClass:[NSArray class]]) {
        
        NSArray *tmp              = value;
        NSMutableArray *dataArray = [NSMutableArray array];
        
        for (NSDictionary *info in tmp) {
            StudentModel *obj  = [[StudentModel alloc] initWithDictionary:info];
            [dataArray addObject:obj];
        }
        
        value = dataArray;
    }
    
    [super setValue:value forKey:key];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        self = [super init];
        if (self) {
            [self setValuesForKeysWithDictionary:dictionary];
        }
        
        return self;
        
    } else {
        return nil;
    }
}

@end

