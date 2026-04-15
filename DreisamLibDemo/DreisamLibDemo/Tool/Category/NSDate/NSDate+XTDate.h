//
//  NSDate+XTDate.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (XTDate)
//超过当前时间
-(BOOL)beyondNow;
//获取今日结束时间
+(NSTimeInterval)getTodayEndTimeInterval;
//获取当前时间戳
+ (NSString *)getTime;
- (NSString *)getTime;
- (NSDate *)dateWithYMD;
+ (NSDate *)dateFromString:(NSString *)timeStr format:(NSString *)format;
//系统时区
-(NSString *)toTimeStrWithDateFormat:(NSString *)format;
//北京时区
-(NSString *)cn_toTimeStrWithDateFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
