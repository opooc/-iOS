//
//  VideoPlayer.h
//  test
//
//  Created by doushuyao on 2020/8/13.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject
+(VideoPlayer *)Player;
-(void)playWithrUrl:(NSString*)videoUrl attachView:(UIView *) attachView;

@end

NS_ASSUME_NONNULL_END
