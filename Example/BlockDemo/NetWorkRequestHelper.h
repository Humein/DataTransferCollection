//
//  NetWorkRequestHelper.h
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
/**
 *  成功。
 *  @param responseObject 返回的数据。
 */
typedef void(^Succsess)(id responseObject);

/**
 *  失败。
 *  @param error 失败原因。
 */
typedef void(^Failure)(NSDictionary *errorMessage);

@interface NetWorkRequestHelper : NSObject
// 回调块代码
@property (nonatomic, copy) Succsess      succsessBlock;
@property (nonatomic, copy) Failure       failedBlock;
singleton_interface(NetWorkRequestHelper)
- (void)requestNetwork:(NSDictionary *)Parameter
           withSuccess:(Succsess)succsess
            andFailure:(Failure)failed;
@end
