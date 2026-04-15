//
//  DQrCodeSacnVC.m
//  DreisamLibDemo
//
//  Created by List on 2025/12/19.
//

#import "DQrCodeSacnVC.h"
#import "QRCScanner.h"

@interface DQrCodeSacnVC ()<QRCodeScanneDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong)  QRCScanner *scanner;

@end

@implementation DQrCodeSacnVC
 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Scan";
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view addSubview:self.scanner];
}
 
-(QRCScanner *)scanner{
    if (!_scanner) {
        _scanner = [[QRCScanner alloc] initQRCScannerWithView:self.view];
        _scanner.delegate = self;
        _scanner.scanningLieColor=[UIColor cyanColor];
        _scanner.notSreachScannerBlock =^(UIButton *sender){
        };
    }
    return _scanner;
}


#pragma mark  - 扫描二维码成功后代理方法
- (void)didFinshedScanningQRCode:(NSString *)result{
    __weak typeof(self)weakSelf = self;
    if (self.codeCompletion) {
        self.codeCompletion(result);
    }
    [self.navigationController popViewControllerAnimated:YES];
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
