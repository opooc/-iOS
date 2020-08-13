//
//  ListItem.m
//  test
//
//  Created by doushuyao on 2020/8/9.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

#pragma mark - NSSecureCoding
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        self.articleUrl = [coder decodeObjectForKey:@"articleUrl"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}



#pragma mark - publicMethod

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 类型是否匹配
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.category = [dictionary objectForKey:@"category"];
    self.author_name = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
}

@end
