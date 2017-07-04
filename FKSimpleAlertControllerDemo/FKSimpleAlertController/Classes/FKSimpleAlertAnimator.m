//
//  FKSimpleAlertAnimator.m
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import "FKSimpleAlertAnimator.h"


@interface FKSimpleAlertAnimator ()

@property (nonatomic, assign, getter= isPresent) BOOL present;

@end

CGFloat const kImageBrowserDuration = 0.3f;

@implementation FKSimpleAlertAnimator

//ios中需要返回协议,一般就是返回遵循这个协议的对象, 执行弹出动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.present = YES;
    return self;
}

//调用这个方法  就代表要执行消失动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.present = NO;
    return self;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kImageBrowserDuration;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.isPresent ? [self animationForPresent:transitionContext] : [self animationForDismiss:transitionContext];
}

#pragma mark -- present动画

- (void)animationForPresent:(id <UIViewControllerContextTransitioning>)context{
    
    //动画时长
    NSTimeInterval duration = [self transitionDuration:context];
    
    UIView *containerView = context.containerView;
    UIView *presentedView = [context viewForKey:UITransitionContextToViewKey];
    
    [context.containerView addSubview:presentedView];
    containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        containerView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
        
    } completion:^(BOOL finished) {
        
        [context completeTransition:finished];
        
    }];
}

#pragma mark -- dismiss动画

- (void)animationForDismiss:(id <UIViewControllerContextTransitioning>)context{
    
    UIView *containerView = context.containerView;
    UIView *presentedView = [context viewForKey:UITransitionContextFromViewKey];
    
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:0.15f delay:0 options:options animations:^{
        
        containerView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [presentedView removeFromSuperview];
        [context completeTransition:finished];
    }];
}

@end
