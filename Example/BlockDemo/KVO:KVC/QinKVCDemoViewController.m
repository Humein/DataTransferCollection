//
//  QinKVCDemoViewController.m
//  BlockDemo_Example
//
//  Created by 鑫鑫 on 2018/4/20.
//  Copyright © 2018年 zhangxinxin. All rights reserved.
//

#import "QinKVCDemoViewController.h"

@interface QinKVCDemoViewController ()

@end

@implementation QinKVCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    KVC 集合遍历
    NSArray* arrStr = @[@"english",@"franch",@"chinese"];
    NSArray* arrCapStr = [arrStr valueForKey:@"capitalizedString"];
    
    for (NSString* str  in arrCapStr) {
        NSLog(@"%@",str);
    }
    
    [arrStr enumerateObjectsUsingBlock:^( NSString  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@">>>>>>>%@%lu",obj,(unsigned long)obj.length);

    }];
    
    NSArray* arrCapStrLength = [arrStr valueForKeyPath:@"capitalizedString.length"];
    for (NSNumber* length  in arrCapStrLength) {
        NSLog(@"%ld",(long)length.integerValue);
    }
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
