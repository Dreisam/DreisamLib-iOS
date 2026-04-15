//
//  NSDateFormatter+XTDateFormatter.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (XTDateFormatter)
//系统时区
+(NSDateFormatter *)xtDateFormatterWithFormat:(NSString *)format;
//北京时区
+(NSDateFormatter *)cn_xtDateFormatterWithFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
