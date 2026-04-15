
//
//  ListHub.m
//  MaoHa
//
//  Created by 猫哈 on 2017/9/14.
//  Copyright © 2017年 lishutian. All rights reserved.
//

#import "ListHub.h"

@implementation ListHub

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f

// 文字大小
#define TEXT_SIZE 16.0f

// 文字颜色
#define TEXT_Color [UIColor whiteColor]

// 背景颜色
#define Backgroud_Color [UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0 alpha:1]


+ (void)showText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit{
    [self hide];
    [ListProgressHUD setMinimumDismissTimeInterval:1.5];
    if (maskBackgroudEdit) {
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeNone];
    }else{
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeClear];
    }
    [ListProgressHUD setForegroundColor:TEXT_Color];
    [ListProgressHUD setBackgroundColor:Backgroud_Color];
    [ListProgressHUD showImage:nil status:text];
    [ListProgressHUD setDefaultStyle:ListProgressHUDStyleCustom];
}

+ (void)showFailureText:(NSString *)text{
    [self hide];
    [ListProgressHUD setMinimumDismissTimeInterval:1.0];
    [ListProgressHUD setForegroundColor:TEXT_Color];
    [ListProgressHUD setBackgroundColor:Backgroud_Color];
    [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeClear];
    [ListProgressHUD setDefaultStyle:ListProgressHUDStyleCustom];
    [ListProgressHUD showErrorWithStatus:text];
}

+ (void)showSuccessText:(NSString *)text{
    [self hide];
    [ListProgressHUD setMinimumDismissTimeInterval:1.0];
    [ListProgressHUD setForegroundColor:TEXT_Color];
    [ListProgressHUD setBackgroundColor:Backgroud_Color];
    [ListProgressHUD setDefaultStyle:ListProgressHUDStyleCustom];
    [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeClear];
    [ListProgressHUD showSuccessWithStatus:text];
}

+ (void)showLoadingText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit showForever:(BOOL)showForever{
    [self hide];
    [ListProgressHUD setForegroundColor:TEXT_Color];
    [ListProgressHUD setBackgroundColor:Backgroud_Color];
    if (text.length) {
        // 有字有菊花
        [ListProgressHUD showWithStatus:text];
    }else{
        // 有菊花无字
        [ListProgressHUD show];
    }
    if (maskBackgroudEdit) {
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeNone];
    }else{
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeClear];
    }
    [ListProgressHUD setDefaultStyle:ListProgressHUDStyleCustom];
    if (!showForever) {
        [ListProgressHUD dismissWithDelay:15];
    }
}

+ (void)showLoadingNoHideText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit showForever:(BOOL)showForever{
    [ListProgressHUD setForegroundColor:TEXT_Color];
    [ListProgressHUD setBackgroundColor:Backgroud_Color];
    if (text.length) {
        // 有字有菊花
        [ListProgressHUD showWithStatus:text];
    }else{
        // 有菊花无字
        [ListProgressHUD show];
    }
    if (maskBackgroudEdit) {
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeNone];
    }else{
        [ListProgressHUD setDefaultMaskType:ListProgressHUDMaskTypeClear];
    }
    [ListProgressHUD setDefaultStyle:ListProgressHUDStyleCustom];
    if (!showForever) {
        [ListProgressHUD dismissWithDelay:15];
    }
}

+ (void)hide {
    [ListProgressHUD dismiss];
}


@end
