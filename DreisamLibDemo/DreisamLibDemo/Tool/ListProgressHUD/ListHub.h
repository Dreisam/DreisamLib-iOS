//
//  ListHub.h
//  MaoHa
//
//  Created by 猫哈 on 2017/9/14.
//  Copyright © 2017年 lishutian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListProgressHUD.h"

@interface ListHub : NSObject

#pragma mark - 建议使用的方法

/** 在window上添加一个只显示文字的HUD */
+ (void)showText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit;

/** 在window上添加一个提示`失败`的HUD */
+ (void)showFailureText:(NSString *)text;

/** 在window上添加一个提示`成功`的HUD */
+ (void)showSuccessText:(NSString *)text;

/** 在指定视图上添加一个提示`加载中`的HUD, 需要手动关闭 */
+ (void)showLoadingText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit showForever:(BOOL)showForever;

+ (void)showLoadingNoHideText:(NSString *)text maskBackgroudEdit:(BOOL)maskBackgroudEdit showForever:(BOOL)showForever;

/** 手动隐藏HUD */
+ (void)hide;


@end
