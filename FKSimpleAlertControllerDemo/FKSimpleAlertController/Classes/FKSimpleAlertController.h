//
//  FKSimpleAlertController.h
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FKSimpleAlertControllerHandler)(void);

@interface FKSimpleAlertController : UIViewController

+ (nullable FKSimpleAlertController *)alertControllerWithTitle:(NSString *)title
                                                       content:(NSString *)content
                                                     leftTitle:(NSString *)leftTitle
                                                    rightTitle:(NSString *)rightTitle;

@property (nullable, nonatomic, copy) FKSimpleAlertControllerHandler leftHandler;
@property (nullable, nonatomic, copy) FKSimpleAlertControllerHandler rightHandler;

@end

NS_ASSUME_NONNULL_END
