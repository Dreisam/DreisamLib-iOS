//
//  NSData+XTData.h
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (XTData)
//data倒叙输出
-(NSData *)reversed;
//data 转 字符串
-(NSString *)toStr;
//转字典
-(NSDictionary *)toDic;
-(int)toInt;
//[high,low]
-(int)toInt_H_L;
//[low,high]
-(int)toInt_L_H;
-(int)toLongInt_L_H;
-(int)toLongInt_H_L;
-(short)toShort_L_H;
-(short)toShort_H_L;
@end

NS_ASSUME_NONNULL_END
