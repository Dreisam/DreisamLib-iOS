//
//  DreisamBuilderParam.h
//  DreisamLib
//
//  Created by List on 2025/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DreisamBuilderParam : NSObject

/// APP id，Required
@property (nonatomic, strong) NSString *appId;

/// Hide log，Default no
@property (nonatomic, assign) BOOL hideLog;

/// Extra Parameters
@property (nonatomic, strong) NSDictionary *extraParameters;

@end

NS_ASSUME_NONNULL_END
