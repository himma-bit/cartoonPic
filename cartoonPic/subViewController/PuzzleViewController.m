
#define KSIZE ([UIScreen mainScreen].bounds.size)
#import "PuzzleViewController.h"

@interface PuzzleViewController ()

@end

@implementation PuzzleViewController

- (void)viewWillAppear:(BOOL)animated{
    UIView* view=[self.tabBarController.view viewWithTag:110];
    view.hidden = true;
}

- (void)viewWillDisappear:(BOOL)animated{
    UIView* view=[self.tabBarController.view viewWithTag:110];
    view.hidden = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTitle:@"拼图"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end