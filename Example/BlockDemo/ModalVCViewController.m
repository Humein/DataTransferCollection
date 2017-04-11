//
//  ModalVCViewController.m
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import "ModalVCViewController.h"
#import "NetWorkRequestHelper.h"
@interface ModalVCViewController ()

@end

@implementation ModalVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NetWorkRequestHelper sharedNetWorkRequestHelper] requestNetwork:nil withSuccess:^(id responseObject) {
        
        BOOL result = [[responseObject objectForKey:@"result"] boolValue];
        if (result) {
            NSArray *Array = [responseObject objectForKey:@"Array"];
            NSString *String = [responseObject objectForKey:@"NSString"];
            NSLog(@"responseObject==%@,%@",Array,String);
        }
        
    } andFailure:^(NSDictionary *errorMessage) {
        if (errorMessage) {
            NSLog(@"errorMessage===%@",errorMessage);
        }
    }];
    // Do any additional setup after loading the view.
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 传值
    if (_valueBlcok) {
        _valueBlcok(@"123");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
