
#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

//创建标题
-(void)createTitle:(NSString *)title;
//创建导航栏左右按钮，tword：left，right
-(void)createLeftButton:(NSString *)imageName andWith:(NSString *)tword;
//按钮的点击事件，item ＝ －1表示左按钮，item＝－2，表示右按钮
-(void)onLeftButtonClick:(UIBarButtonItem *)item;

@end