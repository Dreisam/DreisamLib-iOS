//
//  DQrCodeSacnVC.h
//  DreisamLibDemo
//
//  Created by List on 2025/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DQrCodeSacnVC : UIViewController

@property (nonatomic, copy) void(^codeCompletion)(NSString *code);

@end

NS_ASSUME_NONNULL_END
