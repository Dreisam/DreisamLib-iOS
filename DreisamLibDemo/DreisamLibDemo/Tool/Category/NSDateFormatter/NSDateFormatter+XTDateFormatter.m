//
//  NSDateFormatter+XTDateFormatter.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSDateFormatter+XTDateFormatter.h"

@implementation NSDateFormatter (XTDateFormatter)
+(NSDateFormatter *)xtDateFormatterWithFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    //设定时间格式,这里可以设置成自己需要的格式
//https://blog.csdn.net/qq_14920635/article/details/79228522
    [dateFormatter setDateFormat:format];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return dateFormatter;
}
+(NSDateFormatter *)cn_xtDateFormatterWithFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 设置时区为北京时区
    NSTimeZone *beijingTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    //美国太平洋时区
//    NSTimeZone *beijingTimeZone = [NSTimeZone timeZoneWithName:@"America/Los_Angeles"];
    [dateFormatter setTimeZone:beijingTimeZone];
    [dateFormatter setDateFormat:format];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return dateFormatter;
}
@end
