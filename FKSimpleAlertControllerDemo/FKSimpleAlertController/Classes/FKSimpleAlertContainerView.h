//
//  FKSimpleAlertContainerView.h
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FKSC_MarginVertical 15.f
#define FKSC_MarginHorizontal 25.f
#define FKSC_Padding 10.f
#define FKSC_ButtonHeight 50.f
#define FKSC_LineHeight 1.f



NS_ASSUME_NONNULL_BEGIN

@interface FKSimpleAlertContainerView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@end

NS_ASSUME_NONNULL_END
