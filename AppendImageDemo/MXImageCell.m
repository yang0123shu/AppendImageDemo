//
//  MXImageCell.m
//  AppendImageDemo
//
//  Created by yangshucheng on 2017/6/13.
//  Copyright © 2017年 yangshucheng. All rights reserved.
//

#import "MXImageCell.h"
#import "Masonry.h"
@interface MXImageCell()

@property (nonatomic) UIImageView *fullImageView;
@property (nonatomic) UILabel *fullLabel;
@end

@implementation MXImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_fullImageView) {
            _fullImageView = [[UIImageView alloc]init];
            _fullImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _fullImageView.layer.masksToBounds = YES;
            _fullImageView.layer.cornerRadius = 5;
            _fullImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _fullImageView.layer.borderWidth = 1;
            _fullImageView.contentMode = UIViewContentModeScaleToFill;
        }
        if (!_fullLabel) {
            _fullLabel = [[UILabel alloc]init];
            _fullLabel.font = [UIFont systemFontOfSize:40];
            _fullLabel.text = @"+";
            _fullLabel.textColor = [UIColor darkGrayColor];
            _fullLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _fullLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self addSubview:self.fullImageView];
        [self addSubview:self.fullLabel];
        UIEdgeInsets padding = UIEdgeInsetsMake(2, 2, 2, 2);
        [_fullImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self).with.insets(padding);
            make.left.equalTo(self.mas_left).offset(2);
            make.top.equalTo(self.mas_top).offset(2);
            make.right.equalTo(self.mas_right).offset(-2);
            make.bottom.equalTo(self.mas_bottom).offset(-2);
        }];
        [_fullLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self).with.insets(padding);
            make.left.equalTo(self.mas_left).offset(2);
            make.top.equalTo(self.mas_top).offset(2);
            make.right.equalTo(self.mas_right).offset(-2);
            make.bottom.equalTo(self.mas_bottom).offset(-2);
        }];

//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


-(void)setImage:(UIImage*)image
{
    _fullLabel.hidden = YES;
    _fullImageView.hidden = NO;
    [self bringSubviewToFront:_fullImageView];
    _fullImageView.image = image;
}

-(void)setLastIncrease
{
    _fullImageView.hidden = YES;
    _fullLabel.hidden = NO;
    [self bringSubviewToFront:_fullLabel];
    self.fullLabel.backgroundColor = [UIColor lightTextColor];
    self.backgroundColor = [UIColor lightGrayColor];
}


@end
