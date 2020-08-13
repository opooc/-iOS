//
//  DelectCellView.h
//  test
//
//  Created by doushuyao on 2020/8/8.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DelectCellView : UIView

-(void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
