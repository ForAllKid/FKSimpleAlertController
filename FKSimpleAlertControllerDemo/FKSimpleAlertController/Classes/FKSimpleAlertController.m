//
//  FKSimpleAlertController.m
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import "FKSimpleAlertController.h"
#import "FKSimpleAlertAnimator.h"
#import "FKSimpleAlertContainerView.h"

#ifndef FK_W_H_
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#endif

@interface FKSimpleAlertController ()

{
    CGFloat _containerViewHeight;
}

@property (nonatomic, strong) FKSimpleAlertAnimator *animator;

@property (nonatomic, strong) FKSimpleAlertContainerView *containerView;

@end



@implementation FKSimpleAlertController

#pragma mark - life cycle


+ (FKSimpleAlertController *)alertControllerWithTitle:(NSString *)title
                                              content:(NSString *)content
                                            leftTitle:(nonnull NSString *)leftTitle
                                           rightTitle:(nonnull NSString *)rightTitle{
    
    FKSimpleAlertController *controller = [[FKSimpleAlertController alloc] initWithTitle:title
                                                                                 content:content
                                                                               leftTitle:leftTitle
                                                                              rightTitle:rightTitle];

    return controller;

}

- (instancetype)initWithTitle:(NSString *)title
                      content:(NSString *)content
                    leftTitle:(nonnull NSString *)leftTitle
                   rightTitle:(nonnull NSString *)rightTitle{
    
    self = [super init];
    if (self) {
        _animator = [[FKSimpleAlertAnimator alloc] init];
        self.transitioningDelegate = _animator;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        _containerView = [[FKSimpleAlertContainerView alloc] init];
        _containerView.titleLabel.text = title;
        _containerView.contentLabel.text = content;
        [_containerView.leftButton setTitle:leftTitle forState:UIControlStateNormal];
        [_containerView.rightButton setTitle:rightTitle forState:UIControlStateNormal];
        
        CGSize caculateSize = CGSizeMake(self.view.frame.size.width - FKSC_MarginHorizontal * 2, CGFLOAT_MAX);
        NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;

        NSDictionary *titleAttributes = @{NSFontAttributeName:_containerView.titleLabel.font};
        CGFloat titleHeight = [title boundingRectWithSize:caculateSize
                                                        options:options
                                                     attributes:titleAttributes
                                                        context:nil].size.height;
        titleHeight = ceil(titleHeight);
        
        NSDictionary *contentAttributes = @{NSFontAttributeName:_containerView.contentLabel.font};
        CGFloat contentHeight = [content boundingRectWithSize:caculateSize
                                                            options:options
                                                         attributes:contentAttributes
                                                            context:nil].size.height;
        contentHeight = ceil(contentHeight);
        if (contentHeight < 60) {
            contentHeight = 60;
        }
        
        _containerViewHeight = FKSC_MarginVertical + titleHeight + FKSC_Padding + contentHeight + FKSC_Padding + FKSC_LineHeight + FKSC_ButtonHeight;
        
        [self.view addSubview:_containerView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - config

#pragma mark - delegate || dataSource



#pragma mark - actions


#pragma mark - notification center

- (void)addNotificationCenter{
    
}

- (void)removeNotificationCenter{
    
}

#pragma mark - layout

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.containerView.frame = CGRectMake(0, 0, self.view.frame.size.width - 100, _containerViewHeight);
    self.containerView.center = CGPointMake(kWidth/2, kHeight/2);
    
}


#pragma mark - setter



#pragma mark - getter

//- (FKSimpleAlertContainerView *)containerView{
//    if (!_containerView) {
//        _containerView = [[FKSimpleAlertContainerView alloc] init];
//    }
//    return _containerView;
//}



@end
