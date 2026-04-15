//
//  NSArray+XTArray.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSArray+XTArray.h"

@implementation NSArray (XTArray)
-(NSString *)toJsonStr{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonResult;
}
@end
