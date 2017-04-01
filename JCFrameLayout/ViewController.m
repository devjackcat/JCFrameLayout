//
//  ViewController.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

#import "JCFrameLayout.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray<NSDictionary<NSString*,UIViewController*>*> *datasource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView jc_makeLayout:^(JCFrameMake *make) {
        make.left.jc_equalTo(0);
        make.top.jc_equalTo(0);
        make.right.jc_equalTo(0);
        make.bottom.jc_equalTo(0);
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dict = self.datasource[indexPath.item];
    cell.textLabel.text = dict[@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.datasource[indexPath.item];
    NSString *cls = dict[@"cls"];
    Class class = NSClassFromString(cls);
    UIViewController *vc = [[class alloc]init];
    vc.title = dict[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray<NSDictionary<NSString *,UIViewController *> *> *)datasource{
    if (!_datasource) {
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:@{@"title":@"左，上，右，下",@"cls":@"ExampleVC1"}];
        [array addObject:@{@"title":@"九宫格(绝对布局)",@"cls":@"ExampleVC2"}];
        [array addObject:@{@"title":@"九宫格(相对布局)",@"cls":@"ExampleVC3"}];
        [array addObject:@{@"title":@"五千个方块(绝对布局)",@"cls":@"ExampleVC4"}];
        [array addObject:@{@"title":@"五千个方块(相对布局)",@"cls":@"ExampleVC5"}];
        [array addObject:@{@"title":@"调试测试",@"cls":@"ExampleVC6"}];
        
        _datasource = [array copy];
    }
    return _datasource;
}
@end
