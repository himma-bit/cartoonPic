
#define KSIZE ([UIScreen mainScreen].bounds.size)
#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 0, KSIZE.width-200, 64);
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = label;
}

-(void)createLeftButton:(NSString *)imageName andWith:(NSString *)tword{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(onLeftButtonClick:)];
    if ([tword isEqualToString:@"left"]) {
        self.navigationItem.leftBarButtonItem = item;
        item.tag = -1;
    }else{
        self.navigationItem.rightBarButtonItem = item;
        item.tag = -2;
    }
}

-(void)onLeftButtonClick:(UIBarButtonItem *)item{
    //    子类重写
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end