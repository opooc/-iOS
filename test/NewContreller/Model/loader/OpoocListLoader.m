//
//  OpoocListLoader.m
//  test
//
//  Created by doushuyao on 2020/8/9.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "OpoocListLoader.h"
#import <AFNetworking.h>
#import "ListItem.h"

@implementation OpoocListLoader
- (void)loadListDataWithFinistBlock:(ListLoaderFinishBlock)finishBlock {
    
    ////http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e
    NSArray<ListItem*>* listData =[self _readDataFormLocal];
    if (listData) {
        finishBlock(YES , listData);
    }
    
    NSString *urlStr = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlStr];

    __unused  NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask* dataTask = [session dataTaskWithRequest:listRequest];
    __weak typeof(self) weakSelf = self;
    NSURLSessionTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
#warning 类型检查
        NSArray *dataArray = [[(NSDictionary *)jsonObj objectForKey:@"result"] objectForKey:@"data"];
        NSMutableArray *listItemArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < dataArray.count; i++) {
            ListItem *lim = [[ListItem alloc]init];
            [lim configWithDictionary:dataArray[i]];
            [listItemArray addObject:lim];
        }
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });
    }];
    [dataTask resume];

}

#pragma mark private
-(NSArray<ListItem*>*)_readDataFormLocal{
    NSArray* pathArr =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString* cachePath = [pathArr firstObject];
    NSString* listDataPath = [cachePath stringByAppendingPathComponent:@"GTdata/list"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj =  [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil] fromData:readListData error:nil];
    if ([unarchiveObj isKindOfClass:[NSArray class]] &&[unarchiveObj count] > 0) {
        return (NSArray<ListItem*>*)unarchiveObj;
    }
    return nil;
    
}


-(void)_archiveListDataWithArray:(NSArray<ListItem*>*)array{
    NSArray* pathArr =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString* cachePath = [pathArr firstObject];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString* dataPath = [cachePath stringByAppendingPathComponent:@"GTdata"];
    
    NSError* creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    //创建文件
    NSString* listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData* listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    
    
    
//    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    //反序列化时把所有相关的类全塞进去
//    id unarchiveObj =  [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil] fromData:readListData error:nil];
//
//
//    [[NSUserDefaults standardUserDefaults]setObject:listData forKey:@"test"];
//    NSData* test = [[NSUserDefaults standardUserDefaults] dataForKey:@"test"];
//     id unarchiveObj1 =  [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil] fromData:test error:nil];
    
    

    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    //删除文件
    
//    if (fileExist) {
//        NSError* removeError;
//
//        [fileManager removeItemAtPath:listDataPath error:&removeError];
//    }
    
//    NSFileHandle* fileHandler = [NSFileHandle  fileHandleForUpdatingAtPath:listDataPath];
//    //锚点移至末尾
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    //刷新文件
//    [fileHandler synchronizeFile];
//    //关闭文件.
//    [fileHandler closeFile];
    
}

@end
