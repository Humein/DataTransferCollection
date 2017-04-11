//
//  NetWorkRequestHelper.m
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import "NetWorkRequestHelper.h"
@implementation NetWorkRequestHelper
singleton_implementation(NetWorkRequestHelper)
- (void)requestNetwork:(NSDictionary *)Parameter
           withSuccess:(Succsess)succsess
            andFailure:(Failure)failed
{

    // 记录回调块代码
    self.succsessBlock = succsess;
    self.failedBlock = failed;
    NSArray *array =  @[@"1",@"2",@"3"];
    if(succsess){
        succsess(@{@"result":[NSNumber numberWithBool:YES],@"Array":array,@"NSString":@"String"});
    }
    
    if (failed) {
        [self requestNetworkData:nil];
    }
}
//读到数据后的回调代理
-(void)requestNetworkData:(NSData *)data{
 
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonError;
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    responseObject = @{
                       @"id": @"1",
                       @"number": @"2",
                       @"questionCount": @5,
                       @"selects": @"6",
                       };;
    self.failedBlock(responseObject);
}

@end
