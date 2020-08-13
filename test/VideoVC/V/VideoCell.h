//
//  VideoCell.h
//  test
//
//  Created by doushuyao on 2020/8/12.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UICollectionViewCell
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
