//
//  CellItem.m
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import "CellItem.h"

@implementation CellItem
+(instancetype)itemWithName:(NSString *)name{

    CellItem *item = [[CellItem alloc]init];
    item.name = name;
    return item;
}
@end
