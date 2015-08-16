//
//  WFFMainViewController.m
//  WFFSlideDemo
//
//  Created by wff on 15/8/16.
//  Copyright (c) 2015年 hct. All rights reserved.
//

#import "WFFMainViewController.h"
#import "WFFLeftViewController.h"
#import "AppDelegate.h"

@interface WFFMainViewController ()

@property (nonatomic, strong) WFFLeftViewController *leftVc;

@end

@implementation WFFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"左"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(leftSlide)];
    self.navigationItem.leftBarButtonItem = leftItem;

}

- (WFFLeftViewController *)leftVc{
    if (_leftVc == nil) {
        _leftVc = [[WFFLeftViewController alloc] init];
    }
    return _leftVc;
}

- (void)leftSlide{
    AppDelegate *app = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    [self.leftVc showInView:app.navigationController.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
