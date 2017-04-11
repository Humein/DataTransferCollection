//
//  QinViewController.m
//  BlockDemo
//
//  Created by zhangxinxin on 04/11/2017.
//  Copyright (c) 2017 zhangxinxin. All rights reserved.
//

#import "QinViewController.h"
#import "ModalVCViewController.h"
#import "CellItem.h"
#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3
@interface QinViewController ()<UITableViewDelegate,UITableViewDataSource
>
{
    
}
// 定义模型数组
@property (nonatomic, strong) NSArray *items;
@property(nonatomic,strong) UITableView *tableView;
// 计算结果
@property(nonatomic ,assign) int result;
@end

@implementation QinViewController
#pragma mark -lazyLoad
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor brownColor];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

#pragma mark-lifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
//    保存一段代码
    [self addBlockAction];

    
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"ImageOnRightCell";
    UILabel *mainLabel, *secondLabel;
    UIImageView *photo;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 220.0, 15.0)];
        mainLabel.tag = MAINLABEL_TAG;
        mainLabel.font = [UIFont systemFontOfSize:14.0];
        mainLabel.textAlignment = NSTextAlignmentLeft;
        mainLabel.textColor = [UIColor blackColor];
        mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:mainLabel];
        
        secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 20.0, 220.0, 25.0)];
        secondLabel.tag = SECONDLABEL_TAG;
        secondLabel.font = [UIFont systemFontOfSize:12.0];
        secondLabel.textAlignment = NSTextAlignmentRight;
        secondLabel.textColor = [UIColor darkGrayColor];
        
        secondLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:secondLabel];
        
        photo = [[UIImageView alloc] initWithFrame:CGRectMake(225.0, 0.0, 80.0, 45.0)];
        photo.tag = PHOTO_TAG;
        photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:photo];
    } else {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
        photo = (UIImageView *)[cell.contentView viewWithTag:PHOTO_TAG];
    }
    
    mainLabel.text = [NSString stringWithFormat:@"Title_%ld", (long)indexPath.row];
    secondLabel.text = [NSString stringWithFormat:@"Description_%ld", (long)indexPath.row];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"];
    photo.image = [UIImage imageNamed:imagePath];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取对应模型
    CellItem *item = self.items[indexPath.row];
    if (item.block) {
        item.block();
    }
}
#pragma mark- PrivateMethod
-(void)addBlockAction{
    
    // 声明weakSelf弱指针
    __weak typeof(self) weakSelf = self;
    CellItem *item1 = [CellItem itemWithName:@"参数使用"];
    item1.block = ^{
        //    参数使用
        [weakSelf caculatorBlock];
        NSLog(@"参数使用");
    };
    CellItem *item2 = [CellItem itemWithName:@"返回值,链式编程实现原理"];
    item2.block = ^{
        weakSelf.add(1).add(2).add(3);
        NSLog(@"result = %d",_result);
        NSLog(@"返回值,链式编程实现原理");
    };
    CellItem *ModalAction = [CellItem itemWithName:@"逆向传值"];
    ModalVCViewController *modalVc = [[ModalVCViewController alloc] init];
    ModalAction.block = ^{
        NSLog(@"弹出控制器");
        [weakSelf presentViewController:modalVc animated:YES completion:nil];
    };
    modalVc.valueBlcok = ^(NSString *value) {
         NSLog(@"返回的值===%@",value);
    };
    _items = @[item1,item2,ModalAction];
}

/**
  怎么计算由外界决定,什么时候计算由内部决定.
 */
-(void)caculatorBlock{
    // 只要参数中有^,就表示把block充当参数去使用.
    [self caculator:^(int result){
        
        result += 2;
        result *= 3;
        
        return result;
        
    }];
    
    NSLog(@"%d",_result); // 输出结果:6
}

// 计算器方法
- (void)caculator:(int (^)(int))caculatorBlock
{
    _result = caculatorBlock(_result);
}
// 加法计算器方法
- (QinViewController * (^)(int))add
{
    return ^(int value){
        _result += value;
        return self;
    };
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
