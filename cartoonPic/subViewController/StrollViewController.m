
#define KSIZE ([UIScreen mainScreen].bounds.size)

#import "StrollViewController.h"
#import "PuzzleViewController.h"
@interface StrollViewController ()

@end

@implementation StrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTitle:@"逛一逛"];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake((KSIZE.width - 200) / 2.0, 400, 200, 60)];
    
    [btn setTitle:@"拼图" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.26 green:0.74 blue:0.80 alpha:1.0];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)onClick{
    PuzzleViewController * PuzzleViewCtr = [[PuzzleViewController alloc] init];
    [self.navigationController pushViewController:PuzzleViewCtr animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end