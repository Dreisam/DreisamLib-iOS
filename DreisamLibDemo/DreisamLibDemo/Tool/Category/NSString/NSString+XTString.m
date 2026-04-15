//
//  NSString+XTString.m
//  XiaoTian
//
//  Created by 李伟健 on 2024/1/10.
//

#import "NSString+XTString.h"
#import "NSDateFormatter+XTDateFormatter.h"

#define Placeholder_str @"¯.¯"
#define Placeholder_str_1 @"-/-"
#define Placeholder_str_2 @"--"
#define Placeholder_str_3 @"--:--"

@implementation NSString (XTString)
-(BOOL)isPlaceholder{
    if ([self isEqualToString:Placeholder_str] ||
        [self isEqualToString:Placeholder_str_1] ||
        [self isEqualToString:Placeholder_str_2] ||
        [self isEqualToString:Placeholder_str_3]) {
        return YES;
    }
    return NO;
}

-(NSString *)localizedReplacing:(NSString *)replacementString{
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    NSString *targetString = @"xt_text__1".toLocalized;
    NSRange range = [mutableString rangeOfString:targetString];
    if (range.location != NSNotFound) {
        [mutableString replaceOccurrencesOfString:targetString withString:replacementString options:0 range:range];
           
    }
    return mutableString;
}
-(NSError*)toError{
    return [NSError errorWithDomain:@"td.com" code:NSURLErrorUnknown userInfo:@{NSLocalizedDescriptionKey: self}];
}
-(NSUUID *)toCBUUID{
    return [CBUUID UUIDWithString:self];
}
-(NSData*)toData{
    NSString * string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= string.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [string substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];

        [data appendBytes:&intValue length:1];
    }
    return data;
}
-(id)toArrayOrDic{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return obj;
}
-(NSString *)hexStrToBinaryStr{
    NSMutableString *retnString = [NSMutableString string];
        for(int i = 0; i < [self length]; i++) {
            char c = [[self lowercaseString] characterAtIndex:i];

            switch(c) {
                case '0': [retnString appendString:@"0000"]; break;
                case '1': [retnString appendString:@"0001"]; break;
                case '2': [retnString appendString:@"0010"]; break;
                case '3': [retnString appendString:@"0011"]; break;
                case '4': [retnString appendString:@"0100"]; break;
                case '5': [retnString appendString:@"0101"]; break;
                case '6': [retnString appendString:@"0110"]; break;
                case '7': [retnString appendString:@"0111"]; break;
                case '8': [retnString appendString:@"1000"]; break;
                case '9': [retnString appendString:@"1001"]; break;
                case 'a': [retnString appendString:@"1010"]; break;
                case 'b': [retnString appendString:@"1011"]; break;
                case 'c': [retnString appendString:@"1100"]; break;
                case 'd': [retnString appendString:@"1101"]; break;
                case 'e': [retnString appendString:@"1110"]; break;
                case 'f': [retnString appendString:@"1111"]; break;
                default : break;
            }
        }

        return retnString;
}

//字符串转ascii字符串
-(NSString *)toAsciiString{
    NSMutableString *mstr = [NSMutableString new];
    const char *ch = [self cStringUsingEncoding:NSASCIIStringEncoding];
    for (int i = 0; i < strlen(ch); i++) {
        [mstr appendString:[NSString stringWithFormat:@"%x",ch[i]]];
    }
    return mstr;
}
//444c536e0501b911 cbb8ce90 47303030 30344d00 000000cf 01c805>
//ascii码进制字符串转普通字符串
-(NSString *)asciiStringToStr{
    NSString *hexString = self;
    if(hexString.length % 2 != 0)
    {
        return nil;
    }
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2)
    {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:NSUTF8StringEncoding];
    return unicodeString;
}
//字符串是否全数字
- (BOOL) isValidNumber{
    if ([self length] == 0)
    {
        return NO;
    }
    NSString *regex = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
// 检查身份证号的合法性
- (BOOL) isValidateIDCardNumber{
    NSString *value = self;
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value)
    {
        return NO;
    }
    else
    {
        length = (int)value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray)
    {
        if ([areaCode isEqualToString:valueStart2])
        {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag)
    {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0))
            {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            else
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M compare:[value substringWithRange:NSMakeRange(17,1)] options:NSCaseInsensitiveSearch] == NSOrderedSame)
                {
                    return YES;// 检测ID的校验位
                }
                else
                {
                    return NO;
                }
                
            }
            else
            {
                return NO;
            }
        default:
            return NO;
    }
}
//手机号码验证
-(BOOL)isMobile{
    NSString *mobileNumbel = self;
    /**
     * 手机号码
     * 虚拟运营: 170
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,178
     * 联通：130,131,132,152,155,156,185,186,176
     * 电信：133,1349,153,180,189,181,177(增加)
     */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|7[06-8]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|78|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181,177(增加)
     22         */
    NSString * CT = @"^1((33|53|8[019]|77)[0-9]|349)\\d{7}$";
    
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNumbel]
         || [regextestcm evaluateWithObject:mobileNumbel]
         || [regextestct evaluateWithObject:mobileNumbel]
         || [regextestcu evaluateWithObject:mobileNumbel])) {
        return YES;
    }
    
    return NO;
}
//邮箱验证
-(BOOL)validateEmail{
    NSString *email = self;
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//过滤首尾的空格键
-(NSString *)filtrationSpaceKey{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
//替换还有表情的字符串 用来算高度
-(NSString *)calculationString{
    NSString *str = self;
    if (str.length != 0) {
        NSMutableString *mutableStr = [NSMutableString stringWithString:str];
        NSArray *frontArr = [str componentsSeparatedByString:@"["];
        NSArray *backArr = [str componentsSeparatedByString:@"]"];
        
        NSArray *numFrontArr = [self calculationPositionWithArray:frontArr withFirstStr:[str substringToIndex:1]];
        NSArray *numBackArr = [self calculationPositionWithArray:backArr withFirstStr:[str substringToIndex:1]];
        
        for (int i = 0; i < numFrontArr.count; i ++) {
            NSString *frontStr = numFrontArr[i];
            NSString *backStr = numBackArr[i];
            int frontNum = [frontStr intValue];
            int backNum = [backStr intValue];
            NSRange range = NSMakeRange(frontNum, backNum - frontNum + 1);
            //        NSLog(@"%d,%d,%d",frontNum,backNum,backNum - frontNum + 1);
            [mutableStr deleteCharactersInRange:range];
            
            mutableStr = [NSMutableString stringWithFormat:@"%@😄",mutableStr];
        }
        return [NSString stringWithString:mutableStr];
    } else {
        return @" ";
    }
}
-(NSArray *)calculationPositionWithArray:(NSArray *)arr withFirstStr:(NSString *)str
{
    NSMutableArray *numArr = [NSMutableArray array];
    int num = -1;
    for (int i = 0; i < arr.count; i++) {
        NSString *comStr = arr[i];
        if (i == arr.count - 1) {
            num += comStr.length;
        }else {
            num += comStr.length + 1;
        }
        [numArr addObject:[NSString stringWithFormat:@"%d", num]];
    }
    [numArr removeLastObject];
    return [[numArr reverseObjectEnumerator] allObjects];
}
//hex字符串转Color
-(UIColor *)toColor{
    NSString * hexStr = self;
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
-(NSTimeInterval)toTimeInterWithDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter xtDateFormatterWithFormat:format];
    NSDate *date = [dateFormatter dateFromString:self];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}
-(NSString *)toTimeInterStrWithDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter xtDateFormatterWithFormat:format];
    NSDate *date = [dateFormatter dateFromString:self];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.f",timeInterval];
}
-(NSString *)cn_toTimeInterStrWithDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter cn_xtDateFormatterWithFormat:format];
    NSDate *date = [dateFormatter dateFromString:self];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.f",timeInterval];
}
//时间戳字符串转时间 1693756800 format = yyyy-MM-dd HH:mm:ss 输出 2023-09-04 00:00:00
-(NSString *)toTimeStrWithDateFormat:(NSString *)format{
    NSString *strTime = self;
    if (!strTime || strTime.length == 0) return @"";
    if(strTime.doubleValue == 0) return @"";
    if (strTime.length == 13) {
        NSTimeInterval _interval  =[strTime doubleValue] / 1000.0;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
        NSDateFormatter *dateFormatter = [NSDateFormatter xtDateFormatterWithFormat:format];
        return [dateFormatter stringFromDate: date];
    }else{
        NSTimeInterval time=[strTime doubleValue];
        NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter *dateFormatter = [NSDateFormatter xtDateFormatterWithFormat:format];
        return [dateFormatter stringFromDate: detaildate];
    }
}
@end
