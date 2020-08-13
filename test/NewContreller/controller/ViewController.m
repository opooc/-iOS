//
//  ViewController.m
//  test
//
//  Created by doushuyao on 2020/6/11.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "ViewController.h"
#import "opoocDetileVC.h"
#import "OpoocTableViewCell.h"
#import "DelectCellView.h"
#import "OpoocListLoader.h"
#import "ListItem.h"
//@interface  opoocView : UIView
//@end
//
//@implementation opoocView
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToWindow:newSuperview];
//}
//- (void)didMoveToSuperview{
//    [super didMoveToSuperview];
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//}
//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//}
//
//@end
 


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,OpoocTableViewDelegate>

@property(nonatomic,strong,readwrite)UITableView* tabView;
@property(nonatomic,strong,readwrite)NSArray* dataArr;
@property(nonatomic,strong,readwrite)OpoocListLoader* listLoader;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tabView.dataSource = self;
    _tabView.delegate = self;
    
    [self.view addSubview:_tabView];
    
    _listLoader = [[OpoocListLoader alloc]init];
    
    __weak typeof (self) wself = self;
    [_listLoader loadListDataWithFinistBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
         __strong typeof (self)strongSelf = wself;
        NSLog(@"");
        strongSelf.dataArr = dataArray;
        [strongSelf.tabView reloadData];
    }];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItem* item = _dataArr[indexPath.row];
    opoocDetileVC *vc = [[opoocDetileVC alloc]initWithUrlString:item.articleUrl];
    vc.title = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OpoocTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell =  [[OpoocTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCellWithItem:self.dataArr[indexPath.row]];
    return cell;
}

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteBtn:(UIButton *)deleteBtn{
//    DelectCellView* deleteView = [[DelectCellView alloc]initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteBtn.frame toView:[UIApplication sharedApplication].keyWindow];
//
//
//    __weak typeof (self) wself = self;
//    [deleteView showDeleteViewFromPoint:CGPointMake(rect.origin.x, rect.origin.y) clickBlock:^{
//        __strong typeof (self)strongSelf = wself;
//
////        [strongSelf.dataArr removeLastObject];
//        [strongSelf.tabView deleteRowsAtIndexPaths:@[[strongSelf.tabView indexPathForCell:tableViewCell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
        
//    }];
}






- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidAppear:(BOOL)animated{
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
}
- (void)viewDidDisappear:(BOOL)animated{
    
}

@end
