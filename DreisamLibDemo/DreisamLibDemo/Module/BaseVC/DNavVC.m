//
//  DNavVC.m
//  DreisamLibDemo
//
//  Created by List on 2025/12/18.
//

#import "DNavVC.h"

@interface DNavVC ()

@end

@implementation DNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = UIColor.whiteColor; // 自定义颜色
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
    appearance.shadowColor = nil; // 或 [UIColor clearColor]
    
    [[UINavigationBar appearance] setStandardAppearance:appearance];
    [[UINavigationBar appearance] setScrollEdgeAppearance:appearance];
    [[UINavigationBar appearance] setCompactAppearance:appearance];

}


- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
//        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
//        back.frame = CGRectMake(0, 0,45, 45);
//        back.contentMode = UIViewContentModeCenter;
//        [back setImage:[UIImage imageNamed:@"nav_icon_back_black"] forState:UIControlStateNormal];
//        [back addTarget:viewController action:@selector(click_leftBtn) forControlEvents:UIControlEventTouchUpInside];
//        back.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 15);
//        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:back];
//        viewController.navigationItem.leftBarButtonItem = leftItem;
        
    }
    [super pushViewController:viewController animated:animated];
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
