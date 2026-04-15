//
//  AppDelegate.h
//  DreisamLibDemo
//
//  Created by List on 2025/12/16.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

- (void)launchWriteLogToFile;
- (void)sendLog;

@end

