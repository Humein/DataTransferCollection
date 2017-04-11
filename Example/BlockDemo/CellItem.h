//
//  CellItem.h
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 保存一段代码
 */
@interface CellItem : NSObject
@property (nonatomic ,strong) NSString *name;

// 保存item不同行为的block
@property (nonatomic, strong) void(^block)();

+ (instancetype)itemWithName:(NSString *)name;
@end
