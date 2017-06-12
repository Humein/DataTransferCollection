//
//  ModalVCViewController.m
//  BlockDemo
//
//  Created by 鑫鑫 on 2017/4/11.
//  Copyright © 2017年 zhangxinxin. All rights reserved.
//

#import "ModalVCViewController.h"
#import "NetWorkRequestHelper.h"
#import "PlaceholderView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
// 弱引用
#define Weak_Self __weak typeof(self) weakSelf = self
@interface ModalVCViewController ()
@property(nonatomic,strong) PlaceholderView *holderView;
@end

@implementation ModalVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];

    // Do any additional setup after loading the view.
}

-(void)loadData{
    Weak_Self;
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
        
        
        if (weakSelf.holderView) {
            weakSelf.holderView.hidden = NO;
        }else{
            weakSelf.holderView = [[PlaceholderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
#warning PlaceholderView 弱化
             PlaceholderView __weak *weakObj =  weakSelf.holderView;
             weakObj.backgroundColor = [UIColor whiteColor];
             weakObj.frame = weakSelf.view.frame;
            [weakSelf.view addSubview:weakObj];
            [weakObj addButtonAction:^(id sender) {
                weakObj.hidden = YES;
                [weakSelf loadData];
            }];
            
        }
    }];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 传值
    if (_valueBlcok) {
        _valueBlcok(@"123");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc{
    NSLog(@"ModalVCViewController======销毁");
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
