//
//  ViewController.m
//  FKSimpleAlertControllerDemo
//
//  Created by 周宏辉 on 2017/6/27.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import "ViewController.h"
#import "FKSimpleAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}


- (IBAction)show:(id)sender {

    FKSimpleAlertController *controller = [FKSimpleAlertController alertControllerWithTitle:@"提示"
                                                                                    content:@"这是一个测试用的文字描述"
                                                                                  leftTitle:@"是"
                                                                                 rightTitle:@"否"];
    
    [self presentViewController:controller animated:YES completion:nil];

}


@end
