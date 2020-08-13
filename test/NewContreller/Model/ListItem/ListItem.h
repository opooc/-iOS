//
//  ListItem.h
//  test
//
//  Created by doushuyao on 2020/8/9.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject<NSSecureCoding>

@property(nonatomic,copy,readwrite)NSString* uniquekey;
@property(nonatomic,copy,readwrite)NSString* title;
@property(nonatomic,copy,readwrite)NSString* date;
@property(nonatomic,copy,readwrite)NSString* category;
@property(nonatomic,copy,readwrite)NSString* author_name;
@property(nonatomic,copy,readwrite)NSString* articleUrl;
@property(nonatomic,copy,readwrite)NSString* picUrl;

-(void)configWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
