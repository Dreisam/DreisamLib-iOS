//
//  NSError+XTError.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
static NSString *const BussinessErrorDoman = @"BussinessErrorDoman";
@interface NSError (XTError)
+ (NSError *)bussinessError:(NSInteger)code message:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
