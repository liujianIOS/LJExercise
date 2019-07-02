//
//  MainTableViewController.m
//  LJExercise
//
//  Created by liujian on 2017/11/21.
//  Copyright © 2017年 liujian. All rights reserved.
//

#import "MainTableViewController.h"
#import "LJTextViewContriller.h"
#import "Contant.h"

@interface MainTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray * nameArr;
@property(nonatomic, strong) UITableView * tableView;

@end

static NSString * cell_reuseIdentifier = @"cell_mainTable_reuseIdentifier";

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Overview";
    [self.view addSubview:self.tableView];
}

#pragma mark - UItableVeiwDelegate and UITableViewDataSouirce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_reuseIdentifier];
    cell.textLabel.text = self.nameArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger index = indexPath.row;
    switch (index) {
        case 0:
        {
            LJTextViewContriller * vc = [[LJTextViewContriller alloc] init];
            vc.title = self.nameArr[index];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        default:
            break;
    }
}

//本地分支 测试
#pragma mark - Setter and Getter

-(NSArray *)nameArr{
    if (_nameArr == nil) {
        NSArray * arr = @[@"UITextView"];
        _nameArr = arr;
    }
    return _nameArr;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        CGFloat startY = 44;
        UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, startY, SCREEN_WIDTH, SCREEN_HEIGHT - startY) style:UITableViewStylePlain];
        table.backgroundColor = [UIColor clearColor];
        table.separatorColor = [UIColor lightGrayColor];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.delegate = self;
        table.dataSource = self;
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:cell_reuseIdentifier];
        UIView * footer = [[UIView alloc] init];
        footer.backgroundColor = [UIColor yellowColor];
        table.tableFooterView = footer;
        _tableView = table;
    }
    return _tableView;
}

@end
