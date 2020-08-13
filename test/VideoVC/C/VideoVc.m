//
//  VideoVc.m
//  test
//
//  Created by doushuyao on 2020/8/7.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "VideoVc.h"
#import "VideoCell.h"

@interface VideoVc () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VideoVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing =10;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width/16*9);
    
    UICollectionView* collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectView.delegate = self;
    collectView.dataSource = self;
    
    [collectView registerClass:[VideoCell class] forCellWithReuseIdentifier:@"collectCell"];
    [self.view addSubview:collectView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[VideoCell class]]) {
        //方便讲解事例数据
        [(VideoCell *)cell layoutWithVideoCoverUrl:@"videoCover" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item %3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//
//    }else{
//        return CGSizeMake(self.view.frame.size.width/2-5, 300);
//    }
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

@end
