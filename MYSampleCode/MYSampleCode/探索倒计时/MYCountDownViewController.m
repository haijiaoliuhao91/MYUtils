//
//  MYCountDownViewController.m
//  MYSampleCode
//
//  Created by sunjinshuai on 2017/11/27.
//  Copyright © 2017年 MYSampleCode. All rights reserved.
//

#import "MYCountDownViewController.h"
#import "MYCountDownViewCell.h"
#import "MYCountDownModel.h"

@interface MYCountDownViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation MYCountDownViewController

static NSString * const identifier = @"MYCountDownViewCell";

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"初始化当前的runloopMode:%@",[NSRunLoop mainRunLoop].currentMode);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MYCountDownViewCell class] forCellReuseIdentifier:identifier];
    
    NSLog(@"viewDidLoad当前的runloopMode:%@",[NSRunLoop mainRunLoop].currentMode);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear当前的runloopMode:%@",[NSRunLoop mainRunLoop].currentMode);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollView滑动时当前的runloopMode:%@",[NSRunLoop mainRunLoop].currentMode);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYCountDownViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.countDownModel = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.refreshControl = [[UIRefreshControl alloc] init];
        [_tableView.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger i = 0; i < 50; i++) {
            NSInteger count = arc4random_uniform(100);
            MYCountDownModel *countDownModel = [[MYCountDownModel alloc] init];
            countDownModel.count = count;
            countDownModel.title = [NSString stringWithFormat:@"第%zd条数据", i];
            [array addObject:countDownModel];
        }
        _dataSource = array.copy;
    }
    return _dataSource;
}

@end
