//
//  AppDelegate.m
//  DreisamLibDemo
//
//  Created by List on 2025/12/16.
//

#import "AppDelegate.h"
#import "DLoginVC.h"
#import "DHomeVC.h"
#import "DNavVC.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSString *logFilePath;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self launchWriteLogToFile];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
 
    NSString *deviceName = [[NSUserDefaults standardUserDefaults] objectForKey:BLE_My_DeviceName_Key];
    if (deviceName.length>0) {
        DHomeVC *homeVC = [DHomeVC new];
        self.window.rootViewController = [[DNavVC alloc] initWithRootViewController:homeVC];
    }else{
        self.window.rootViewController = [[DNavVC alloc] initWithRootViewController:[DLoginVC new]];
    }
    
    //强制关闭暗黑模式
    if(@available(iOS 13.0,*)){
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    }
    
    return YES;
}
 


- (void)launchWriteLogToFile{
#if !DEBUG
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *pathString = [documentDirectory stringByAppendingPathComponent:@"DreisamLibLogFile"];
    NSFileManager*fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:pathString]){
        [fileManager createDirectoryAtPath:pathString withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *fileName = [NSString stringWithFormat:@"LOG-%@.txt",[UIDevice currentDevice].name];
    self.logFilePath = [pathString stringByAppendingPathComponent:fileName];
    
    // 将log输入到文件
    freopen([self.logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([self.logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
#endif
     
}


- (void)sendLog{
    
#if DEBUG
    [ListHub showText:@"Debug环境不支持发送日志" maskBackgroudEdit:YES];
    return;
#endif
    
    // 创建放zip的文件
    NSData *data = [[NSData alloc] initWithContentsOfFile:self.logFilePath];
    NSURL *tempUrl = [NSURL fileURLWithPath:self.logFilePath];
  
    if (!data) {
        return;
    }

    //创建提示框控制器
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择发送到哪儿" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建提示按钮
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"微信/其它APP" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openSendView:@[tempUrl,data] zipPath:self.logFilePath];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"隔空投送" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openSendView:@[data] zipPath:self.logFilePath];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    //添加提示按钮
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

// 开始显示要发送的框
- (void)openSendView:(NSArray *)activityItemsArray zipPath:(NSString *)zipPath{
    
    // 2、初始化控制器，添加分享内容至控制器
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:nil];
    activityVC.modalInPopover = YES;
    activityVC.restorationIdentifier = @"activity";
    
    // ios8.0 之后用此方法回调
    UIActivityViewControllerCompletionWithItemsHandler itemsBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
    };
    activityVC.completionWithItemsHandler = itemsBlock;
    // 4、调用控制器
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:activityVC animated:YES completion:nil];
    
}

@end
