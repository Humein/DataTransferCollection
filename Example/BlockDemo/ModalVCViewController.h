//
//  ModalVCViewController.h
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import <UIKit/UIKit.h>
// 在要modal的控制器B声明一个带参数block属性
@interface ModalVCViewController : UIViewController
@property (nonatomic ,strong) void(^valueBlcok)(NSString *value);
@end
