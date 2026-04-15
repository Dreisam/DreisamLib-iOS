//
//  NSString+XTString.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CoreBluetooth/CoreBluetooth.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (XTString)
-(BOOL)isPlaceholder;
-(NSString *)toLocalized;
//替换文本中占位字符串
-(NSString *)localizedReplacing:(NSString *)replacementString;
//16进制字符串转data
-(NSData*)toData;
-(id)toArrayOrDic;
-(NSString *)hexStrToBinaryStr;
-(CBUUID *)toCBUUID;
-(NSError*)toError;

//字符串转ascii字符串
-(NSString *)toAsciiString;
//ascii字符串转普通字符串
-(NSString *)asciiStringToStr;
//字符串是否全数字
-(BOOL) isValidNumber;
// 检查身份证号的合法性
-(BOOL) isValidateIDCardNumber;
//手机号码验证
-(BOOL)isMobile;
//邮箱验证
-(BOOL)validateEmail;
//过滤首尾的空格键
-(NSString *)filtrationSpaceKey;
//替换还有表情的字符串 用来算高度
-(NSString *)calculationString;
//hex字符串转Color
-(UIColor *)toColor;

//时间字符串转时间戳字符串 2023-09-04 00:00:00  format = yyyy-MM-dd HH:mm:ss 输出 1693756800
-(NSTimeInterval)toTimeInterWithDateFormat:(NSString *)format;
//时间字符串转时间戳字符串 2023-09-04 00:00:00  format = yyyy-MM-dd HH:mm:ss 输出@“1693756800”
-(NSString *)toTimeInterStrWithDateFormat:(NSString *)format;
//时间字符串转时间戳字符串 2023-09-04 00:00:00  format = yyyy-MM-dd HH:mm:ss 输出@“1693756800”   用北京时区
-(NSString *)cn_toTimeInterStrWithDateFormat:(NSString *)format;
//时间戳字符串转时间 1693756800 format = yyyy-MM-dd HH:mm:ss 输出 2023-09-04 00:00:00
-(NSString *)toTimeStrWithDateFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
