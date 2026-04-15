//
//  NSError+XTError.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSError+XTError.h"

@implementation NSError (XTError)
+ (NSError *)bussinessError:(NSInteger)code message:(NSString *)message{
    NSDictionary *userInfo = nil;
    if (message) {
        userInfo = @{NSLocalizedDescriptionKey: message};
    }
    return [NSError errorWithDomain:BussinessErrorDoman code:code userInfo:userInfo];
}
@end
