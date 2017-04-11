//
//  QinViewController.m
//  BlockDemo
//
//  Created by zhangxinxin on 04/11/2017.
//  Copyright (c) 2017 zhangxinxin. All rights reserved.
//

#import "QinViewController.h"
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
@end

@implementation QinViewController

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    
    CellItem *item1 = [CellItem itemWithName:@"张三"];
    item1.block = ^{
        NSLog(@"我是张三");
    };
    CellItem *item2 = [CellItem itemWithName:@"李四"];
    item2.block = ^{
        NSLog(@"我是李四");
    };
    
    _items = @[item1,item2];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
