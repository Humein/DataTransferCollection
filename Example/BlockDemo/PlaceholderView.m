//
//  PlaceholderView.m
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/6/12.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import "PlaceholderView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface PlaceholderView()
@property (nonatomic, strong, nullable) reloadClickBlock block;
@property (nonatomic, strong, nullable) UIButton *button;
@end
@implementation PlaceholderView
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title withCallBack:(reloadClickBlock)callBack{


      if(self=[super initWithFrame:frame]){
        
        self.block = callBack;
        
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(ScreenWidth*3/8, 240, ScreenWidth / 4, ScreenWidth / 4);
        [self addSubview:imageView];
        
        NSMutableArray *imgArray = [NSMutableArray array];
        for (int i=0; i<3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"placehold%d.png",i]];
            [imgArray addObject:image];
        }
        imageView.animationImages = imgArray;
        imageView.animationDuration = 6*0.15;
        imageView.animationRepeatCount = 0;
        [imageView startAnimating];
        
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, imageView.frame.origin.y+20+ScreenWidth/4, ScreenWidth, 30);
        label.textColor = [UIColor lightGrayColor];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [self addSubview:label];
        
        UIButton *refreshBTN = [UIButton buttonWithType:UIButtonTypeCustom];
        [refreshBTN setTitle:@"重新加载" forState:UIControlStateNormal];
        [refreshBTN setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        refreshBTN.titleLabel.font = [UIFont systemFontOfSize:14];
        refreshBTN.layer.masksToBounds = YES;
        refreshBTN.layer.borderWidth = 1;
        refreshBTN.layer.cornerRadius = 3;
        refreshBTN.layer.borderColor = [UIColor lightGrayColor].CGColor;
        refreshBTN.frame = CGRectMake(ScreenWidth/2-50, label.frame.origin.y+60, 100, 30);
        [self addSubview:refreshBTN];
        [refreshBTN addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    }

    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(ScreenWidth*3/8, 240, ScreenWidth / 4, ScreenWidth / 4);
        [self addSubview:imageView];
        
        NSMutableArray *imgArray = [NSMutableArray array];
        for (int i=0; i<3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"placehold%d.png",i]];
            [imgArray addObject:image];
        }
        imageView.animationImages = imgArray;
        imageView.animationDuration = 6*0.15;
        imageView.animationRepeatCount = 0;
        [imageView startAnimating];
        
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, imageView.frame.origin.y+20+ScreenWidth/4, ScreenWidth, 30);
        label.textColor = [UIColor lightGrayColor];
        label.text = @"亲,您的手机网络不太顺畅喔~";
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [self addSubview:label];
        
        UIButton *refreshBTN = [UIButton buttonWithType:UIButtonTypeCustom];
        [refreshBTN setTitle:@"重新加载" forState:UIControlStateNormal];
        [refreshBTN setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        refreshBTN.titleLabel.font = [UIFont systemFontOfSize:14];
        refreshBTN.layer.masksToBounds = YES;
        refreshBTN.layer.borderWidth = 1;
        refreshBTN.layer.cornerRadius = 3;
        refreshBTN.layer.borderColor = [UIColor lightGrayColor].CGColor;
        refreshBTN.frame = CGRectMake(ScreenWidth/2-50, label.frame.origin.y+60, 100, 30);
        [self addSubview:refreshBTN];
        [refreshBTN addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return self;
}

//实现block回调的方法
- (void)addButtonAction:(reloadClickBlock)block {
    self.block = block;
}
- (void)buttonAction {
    if (self.block) {
        self.block(self);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
