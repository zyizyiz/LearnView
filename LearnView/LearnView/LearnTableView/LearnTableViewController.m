//
//  LearnTableViewController.m
//  LearnView
//
//  Created by ios on 2019/1/8.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 UITableView调用机制 ：
    numberOfSectionsInTableView -> numberOfRowsInSection
    -> cellForRowAtIndexPath -> heightForRowAtIndexPath
    -> cell's layoutSubviews

 
 */

#import "LearnTableViewController.h"
#import "LearnTableViewCell.h"

static NSString *identifier = @"LearnTableViewCell";
static CGFloat cellHeight = 10 + 20 + 34;
@interface LearnTableViewController ()

// 数组
@property(nonatomic,copy)NSMutableArray *modelList;

@end

@implementation LearnTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL isTableView = [self.view isMemberOfClass:[UITableView class]];
    // self.view isTableView 1
    // 代表UITableViewController中的self.view就是UITableView
    NSLog(@"self.view isTableView %i",isTableView);
    
    [self registerCell];
    _modelList = [[NSMutableArray alloc]init];
    for (int i = 0; i < 20; i++) {
        [_modelList addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.tableView reloadData];
    
    
}

-(void)registerCell {
    [self.tableView registerClass:[LearnTableViewCell class] forCellReuseIdentifier:identifier];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    return _modelList != nil ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    return _modelList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    LearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[LearnTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.name = _modelList[indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    // 优化：减少计算的次数
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _modelList[indexPath.row] = @"xxx";
    [self.tableView deselectRowAtIndexPath:indexPath animated:false];
    // 刷新一行数据
    [self.tableView beginUpdates];
    NSArray *indexPathArr = @[indexPath];
    [self.tableView reloadRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}
@end
