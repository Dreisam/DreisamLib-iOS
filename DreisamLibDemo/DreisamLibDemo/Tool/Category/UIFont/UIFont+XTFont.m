//
//  UIFont+XTFont.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "UIFont+XTFont.h"

@implementation UIFont (XTFont)
+(UIFont *)pingFangRegular:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}
+(UIFont *)pingFangMedium:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}
+(UIFont *)pingFangSemibold:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}
+(UIFont *)pingFangBold:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Bold" size:size];
}
+(UIFont *)pingFangHeavy:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Heavy" size:size];
}
+(UIFont *)pingFangBlack:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Black" size:size];
}
@end
