//
//  NSDate+XTDate.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSDate+XTDate.h"
#import "NSDateFormatter+XTDateFormatter.h"

@implementation NSDate (XTDate)
//超过当前时间
-(BOOL)beyondNow{
    return [self timeIntervalSince1970]>NSDate.date.timeIntervalSince1970;
}

+ (NSString *)getTime {
    return [NSString stringWithFormat:@"%.f",NSDate.date.timeIntervalSince1970];
}
- (NSString *)getTime {
    return [NSString stringWithFormat:@"%.f",self.timeIntervalSince1970];
}
- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [NSDateFormatter xtDateFormatterWithFormat:@"yyyy-MM-dd"];
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}
+ (NSDate *)dateFromString:(NSString *)timeStr format:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter xtDateFormatterWithFormat:format];
    NSDate * date = [formatter dateFromString:timeStr];
    
    return date;
}
-(NSString *)toTimeStrWithDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter xtDateFormatterWithFormat:format];
    return [dateFormatter stringFromDate: self];
}
-(NSString *)cn_toTimeStrWithDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter cn_xtDateFormatterWithFormat:format];
    return [dateFormatter stringFromDate: self];
}
@end
