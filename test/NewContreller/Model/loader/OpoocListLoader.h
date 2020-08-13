//
//  OpoocListLoader.h
//  test
//
//  Created by doushuyao on 2020/8/9.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  ListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ListLoaderFinishBlock)(BOOL success , NSArray<ListItem *>* dataArray);



/// 列表请求
@interface OpoocListLoader : NSObject
-(void)loadListDataWithFinistBlock:(ListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
