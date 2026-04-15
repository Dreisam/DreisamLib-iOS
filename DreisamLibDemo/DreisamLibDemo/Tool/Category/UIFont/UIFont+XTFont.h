//
//  UIFont+XTFont.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (XTFont)
//常规
+(UIFont *)pingFangRegular:(CGFloat)size;
//中等
+(UIFont *)pingFangMedium:(CGFloat)size;
//半粗
+(UIFont *)pingFangSemibold:(CGFloat)size;
//粗体
+(UIFont *)pingFangBold:(CGFloat)size;
//中黑
+(UIFont *)pingFangHeavy:(CGFloat)size;
//黑体
+(UIFont *)pingFangBlack:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
