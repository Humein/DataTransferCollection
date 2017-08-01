//
//  PlaceholderView.h
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/6/12.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^reloadClickBlock) (id sender);
@interface PlaceholderView : UIView

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title withCallBack:(reloadClickBlock)callBack;


//废弃
//- (void)addButtonAction:(reloadClickBlock)block;
@end
