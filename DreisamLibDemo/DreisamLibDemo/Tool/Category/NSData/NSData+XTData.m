//
//  NSData+XTData.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSData+XTData.h"

@implementation NSData (XTData)
-(NSData *)reversed{
    Byte *b = (Byte *)malloc(self.length);
    for (int j = 0; j < self.length; ++j) {
        b[j] = ((UInt8 *)self.bytes)[self.length-j-1];
    }
    return [NSData dataWithBytes:b length:self.length];
}
-(NSString *)toStr{
    NSMutableString *originalDataString = [NSMutableString string];
    Byte *b = (Byte *)malloc(self.length);
    for (int j = 0; j < self.length; ++j) {
        b[j] = ((UInt8 *)self.bytes)[j];
        [originalDataString appendString:[NSString stringWithFormat:@"%02X", b[j]]];
    }
    return originalDataString;
}
-(NSDictionary *)toDic{
    id obj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
    if([obj isKindOfClass:NSDictionary.class]){
        return obj;
    }else{
        return @{};
    }
    
}
-(int)toInt{
    if(self.length != 1){
        return 0;
    }
    return ((UInt8 *)self.bytes)[0] & 0xff;
}
//[high,low]
-(int)toInt_H_L{
    if(self.length != 2){
        return 0;
    }
    int n = -1;
    n = ((UInt8 *)self.bytes)[0] & 0xff;
    n = n << 8;
    n = n | (((UInt8 *)self.bytes)[1] & 0xff);
    return n;
}
//[low,high]
-(int)toInt_L_H{
    if(self.length != 2){
        return 0;
    }
    int n = -1;
    n = ((UInt8 *)self.bytes)[1] & 0xff;
    n = n << 8;
    n = n | (((UInt8 *)self.bytes)[0] & 0xff);
    return n;
}
-(int)toLongInt_L_H{
    Byte *byte = (Byte*)[self bytes];
    return (byte[3]<<24)+(byte[2]<<16)+(byte[1]<<8)+(byte[0]);
}
-(int)toLongInt_H_L{
    Byte *byte = (Byte*)[self bytes];
    return (byte[0]<<24)+(byte[1]<<16)+(byte[2]<<8)+(byte[3]);
}
-(short)toShort_H_L{
    if(self.length != 2){
        return 0;
    }
    short n = -1;
    n = ((UInt8 *)self.bytes)[0] & 0xff;
    n = n << 8;
    n = n | (((UInt8 *)self.bytes)[1] & 0xff);
    return n;
}
-(short)toShort_L_H{
    if(self.length != 2){
        return 0;
    }
    short n = -1;
    n = ((UInt8 *)self.bytes)[1] & 0xff;
    n = n << 8;
    n = n | (((UInt8 *)self.bytes)[0] & 0xff);
    return n;
}
@end
