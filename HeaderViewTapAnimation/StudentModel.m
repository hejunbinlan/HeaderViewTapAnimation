//
//  StudentModel.m
//
//  http://www.cnblogs.com/YouXianMing/
//  https://github.com/YouXianMing
//
//  Copyright (c) YouXianMing All rights reserved.
//


#import "StudentModel.h"

@implementation StudentModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
 
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    // 过滤NSNull值
    if ([value isKindOfClass:[NSNull class]]) {
        
        return;
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

