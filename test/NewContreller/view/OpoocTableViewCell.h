//
//  OpoocTableViewCell.h
//  test
//
//  Created by doushuyao on 2020/8/7.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;
@protocol OpoocTableViewDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteBtn:(UIButton*)deleteBtn;

@end


@interface OpoocTableViewCell : UITableViewCell
@property(nonatomic,weak,readwrite) id<OpoocTableViewDelegate> delegate;

-(void)layoutTableViewCellWithItem:(ListItem* )item;

@end

NS_ASSUME_NONNULL_END
