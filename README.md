# FKSimpleAlertController

### 说明:
>简易的弹窗，使用转场动画的方式，转场动画可以查看```FKSimpleAlertAnimator.h ``` 和 ``` FKSimpleAlertAnimator.m```文件查看

### 使用方式

```
   FKSimpleAlertController *controller = [FKSimpleAlertController alertControllerWithTitle:@"提示"
                                                                                    content:@"这是一个测试用的文字描述"
                                                                                  leftTitle:@"是"
                                                                                 rightTitle:@"否"];
    
    [self presentViewController:controller animated:YES completion:nil];

```

### 更新日志:

##### v0.0.4:

- 添加弹窗背景阴影，修复iPad上弹窗太宽的问题
