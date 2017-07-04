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
                                                                                    content:@"书柜一打开,如图书信息有误,清空书柜"
                                                                                  leftTitle:@"是"
                                                                                 rightTitle:@"否"];
    
    [self presentViewController:controller animated:YES completion:nil];

}


@end
