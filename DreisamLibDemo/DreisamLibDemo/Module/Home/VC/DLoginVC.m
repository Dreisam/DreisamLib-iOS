//
//  DLoginVC.m
//  DreisamLibDemo
//
//  Created by List on 2025/12/25.
//

#import "DLoginVC.h"
#import "DQrCodeSacnVC.h"
#import "DHomeVC.h"
#import "DNavVC.h"
#import "AppDelegate.h"
#import "BATextField.h"

@interface DLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *deviceNameFiled;
@property (weak, nonatomic) IBOutlet UIButton *connectBtn;

@end

@implementation DLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // textFieldID：识别 ID，要用到历史记录，请务必添加
    self.deviceNameFiled.ba_textFieldID = @"user_account";

    self.deviceNameFiled.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceNameFiled"];
    [self.deviceNameFiled addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.deviceNameFiled addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingDidBegin];
    
    // delete cache
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:BLE_My_DeviceName_Key];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:BLE_My_Glucose_Ary_Key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)scanBtnAction:(id)sender {
    __weak typeof(self)weakSelf = self;
    DQrCodeSacnVC *vc = [DQrCodeSacnVC new];
    vc.codeCompletion = ^(NSString * _Nonnull code) {
        weakSelf.deviceNameFiled.text = code;
    };
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)connectBtnAction:(id)sender {
    if (self.deviceNameFiled.text.length==0) {
        [ListHub showText:self.deviceNameFiled.placeholder maskBackgroudEdit:YES];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.deviceNameFiled.text forKey:BLE_My_DeviceName_Key];
    [[NSUserDefaults standardUserDefaults] setObject:self.deviceNameFiled.text forKey:@"deviceNameFiled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    // 同步数据
    [self.deviceNameFiled ba_textFieldHistoryArraySynchronize];
    // 同步完数据后，记得隐藏 历史数据
    [self.deviceNameFiled ba_textFieldHistoryArrayHide];
    
    DHomeVC *vc = [DHomeVC new];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = [[DNavVC alloc] initWithRootViewController:vc];
     
}


- (void)textFieldChange:(UITextField *)textField{
    // 当开始编辑的时候，显示 历史数据
    [textField ba_textFieldHistoryArrayShow];
    
    self.connectBtn.enabled = self.deviceNameFiled.ba_textFieldHistoryArray>0?NO:YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
     
    self.connectBtn.enabled = YES;
    
    // 同步完数据后，记得隐藏 历史数据
    [self.deviceNameFiled ba_textFieldHistoryArrayHide];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
