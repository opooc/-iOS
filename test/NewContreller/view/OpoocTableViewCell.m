//
//  OpoocTableViewCell.m
//  test
//
//  Created by doushuyao on 2020/8/7.
//  Copyright © 2020 com.opooc.www. All rights reserved.
//

#import "OpoocTableViewCell.h"
#import "ListItem.h"
#import "SDWebImage.h"

@interface OpoocTableViewCell ()
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;
@property (nonatomic, strong, readwrite) UIImageView *rightImageView;
@property (nonatomic, strong, readwrite) UIButton *delectBtn;

@end

@implementation OpoocTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 270, 50)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_titleLabel];

        _sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 50, 20)];
        _sourceLabel.font = [UIFont systemFontOfSize:12];
        _sourceLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_sourceLabel];

        _commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];
        _commentLabel.font = [UIFont systemFontOfSize:12];
        _commentLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_commentLabel];

        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 70, 50, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_timeLabel];

        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(300, 15, 100, 70)];
        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_rightImageView];

//        _delectBtn = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
//        [_delectBtn setTitle:@"xx" forState:UIControlStateNormal];
//        [_delectBtn setTitle:@"tt" forState:UIControlStateHighlighted];
//
//        _delectBtn.layer.cornerRadius = 10;
//        _delectBtn.layer.masksToBounds = YES;
//        _delectBtn.layer.borderWidth = 2;
//        _delectBtn.layer.borderColor = [[UIColor lightGrayColor]   CGColor ];
//        [_delectBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_delectBtn];
    }

    return self;
}

- (void)layoutTableViewCellWithItem:(ListItem *)item {
    
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else{
        self.titleLabel.textColor = [UIColor blackColor ];
    }
    
    _titleLabel.text = item.title;

    _sourceLabel.text = item.author_name;
    [_sourceLabel sizeToFit];

    _commentLabel.text = item.category;
    [_commentLabel sizeToFit];
    _commentLabel.frame = CGRectMake(_sourceLabel.frame.origin.x + _sourceLabel.frame.size.width + 15, _commentLabel.frame.origin.y, _commentLabel .frame.size.width, _commentLabel.frame.size.height);

    _timeLabel.text = item.date;
    [_timeLabel sizeToFit];
    _timeLabel.frame = CGRectMake(_commentLabel.frame.origin.x + _commentLabel.frame.size.width + 15, _sourceLabel.frame.origin.y, _timeLabel.frame.size.width, _timeLabel.frame.size.height);

    
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString: item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    
    
    
    
//    NSThread* downloadImageThread = [[NSThread alloc]initWithBlock:^{
//
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//              _rightImageView.image = image;
//        });
//    });
    
    
    
}

- (void)btnClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteBtn:)]) {
        [self.delegate tableViewCell:self clickDeleteBtn:self.delectBtn];
    }
}

@end
