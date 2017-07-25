//
//  FKSimpleAlertContainerView.m
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import "FKSimpleAlertContainerView.h"

@interface FKSimpleAlertContainerView ()

@property (nonatomic, strong) UIView *horizontalLine;

@property (nonatomic, strong) UIView *verticalLine;

@property (nonatomic, strong) UIImageView *backImageView;

@end

@implementation FKSimpleAlertContainerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 10.f;
        self.layer.shadowOpacity = 1.f;
        
        UIImage *image = [UIImage imageNamed:@"FKSimpleAlertController_bg"];
        CGSize imageSize = image.size;
        
        UIEdgeInsets insets = UIEdgeInsetsMake(imageSize.width/2-1,
                                               imageSize.height/2-1,
                                               imageSize.width/2-1,
                                               imageSize.height/2-1);
        
        image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
        
        _backImageView = [UIImageView new];
        _backImageView.image = image;
        [self addSubview:_backImageView];
        
        
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [self colorWithHex:0x333333];
        _titleLabel.font = [UIFont systemFontOfSize:16.f weight:UIFontWeightLight];
        [self addSubview:_titleLabel];
        
        _contentLabel = [UILabel new];
        _contentLabel.textColor = [self colorWithHex:0x333333];
        _contentLabel.font = [UIFont systemFontOfSize:18.f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
        
        _leftButton = [UIButton new];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        _leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_leftButton setTitleColor:[self colorWithHex:0xcccccc] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        
        _rightButton = [UIButton new];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rightButton setTitleColor:[self colorWithHex:0x65c4aa] forState:UIControlStateNormal];
        [self addSubview:_rightButton];
        
        _horizontalLine = [UIView new];
        _horizontalLine.backgroundColor = [self colorWithHex:0xf6f6f6];
        [self addSubview:_horizontalLine];
        
        _verticalLine = [UIView new];
        _verticalLine.backgroundColor = [self colorWithHex:0xf6f6f6];
        [self addSubview:_verticalLine];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat const width  = self.frame.size.width;
    CGFloat const height = self.frame.size.height;

    self.backImageView.frame = self.bounds;
    
    
    NSString *title = self.titleLabel.text;
    if (!title) {
        title = @"测试";
    }
    
    CGSize caculateSize = CGSizeMake(width - FKSC_MarginHorizontal * 2, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    NSDictionary *titleAttributes = @{NSFontAttributeName:self.titleLabel.font};
    
    //计算标题默认高度
    CGFloat titleHeight = [title boundingRectWithSize:caculateSize
                                         options:options
                                      attributes:titleAttributes
                                         context:nil].size.height;
    
    titleHeight = ceil(titleHeight);
    
    self.titleLabel.frame = CGRectMake(FKSC_MarginHorizontal, FKSC_MarginVertical, width - FKSC_MarginHorizontal * 2, titleHeight);
    
    //计算内容默认高度
    NSString *content = self.contentLabel.text;
    if (!content) {
        content  = @"测试";
    }
    
    NSDictionary *contentAttributes = @{NSFontAttributeName:self.contentLabel.font};
    
    CGFloat contentHeight = [content boundingRectWithSize:caculateSize
                                                        options:options
                                                     attributes:contentAttributes
                                                        context:nil].size.height;
    contentHeight = ceil(contentHeight);
    if (contentHeight < 60) {
        contentHeight = 60;
    }
    
    self.contentLabel.frame = CGRectMake(FKSC_MarginHorizontal, CGRectGetMaxY(self.titleLabel.frame) + FKSC_Padding, width - FKSC_MarginHorizontal * 2, contentHeight);
    
    self.horizontalLine.frame = CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame) + FKSC_Padding, width, FKSC_LineHeight);
    
    self.leftButton.frame = CGRectMake(0, CGRectGetMaxY(self.horizontalLine.frame), width / 2 - 0.5f, FKSC_ButtonHeight);
    
    self.verticalLine.frame = CGRectMake(CGRectGetMaxX(self.leftButton.frame), CGRectGetMaxY(self.horizontalLine.frame), 1, height - CGRectGetMaxY(self.horizontalLine.frame));
    
    self.rightButton.frame = CGRectMake(CGRectGetMaxX(self.verticalLine.frame), CGRectGetMinY(self.leftButton.frame), CGRectGetWidth(self.leftButton.frame), CGRectGetHeight(self.leftButton.frame));
    
}


- (UIColor *)colorWithHex:(UInt32)hex{
    return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f
                           green:((hex & 0xFF00) >> 8) / 255.0f
                            blue:( hex & 0xFF) / 255.0f
                           alpha:1];
}

@end
