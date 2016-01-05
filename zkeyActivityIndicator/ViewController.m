//
//  ViewController.m
//  zkeyActivityIndicator
//
//  Created by 梁志鹏 on 12/23/15.
//  Copyright © 2015 overcode. All rights reserved.
//

#import "ViewController.h"

#import "zkeyActivityIndicatorView.h"

@interface ViewController ()

@property (nonatomic, strong, nonnull)zkeyActivityIndicatorView *activityIndicator;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)test01:(id)sender {
    [self.activityIndicator removeFromSuperview];
    [self.activityIndicator setTitle:@"请稍等..."];
    [self.view addSubview:self.activityIndicator];
}

- (IBAction)test02:(id)sender {
    [self.activityIndicator removeFromSuperview];
    [self.activityIndicator setTitle:@"正在更换头像..."];
    [self.view addSubview:self.activityIndicator];
}

- (IBAction)test03:(id)sender {
    [self.activityIndicator removeFromSuperview];
    [self.activityIndicator setTitle:@"您所选择的座位还有215张余票，系统正在为您分配座位..."];
    [self.view addSubview:self.activityIndicator];
}

- (IBAction)customAlloc:(id)sender {
    [self.activityIndicator removeFromSuperview];
    self.activityIndicator = [[zkeyActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300.0f) title:@"使用自定义方法得到实例"];
    [self.view addSubview:self.activityIndicator];
}

- (IBAction)hideView:(UIButton *)sender {
    if (self.activityIndicator.hidden) {
        self.activityIndicator.hidden = NO;
        [sender setTitle:@"隐藏控件" forState:UIControlStateNormal];
    } else {
        self.activityIndicator.hidden = YES;
        [sender setTitle:@"显示控件" forState:UIControlStateNormal];
    }
}

/*
 * lazy load
 */
- (zkeyActivityIndicatorView *)activityIndicator
{
    if (!_activityIndicator) {
        _activityIndicator = ({
            zkeyActivityIndicatorView *indicator = [[zkeyActivityIndicatorView alloc] init];
            
            // do more custom initialize here
            indicator.frame = CGRectMake(0, 0, self.view.frame.size.width, 300.0f);
            
            
            indicator;
        });
    }
    
    return _activityIndicator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
