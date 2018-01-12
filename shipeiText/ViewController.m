//
//  ViewController.m
//  shipeiText
//
//  Created by hongbaodai on 2017/11/30.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "ViewController.h"
#import "DDEqbView.h"
#import "MYPopupView.h"
#import "TwoViewController.h"


@interface ViewController () <MYPopupDelegate>

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.view.safeAreaInsets = UIEdgeInsetsMake(44, 0, 34, 0);
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 44+44, self.view.frame.size.width, 100)];
    
    [self.view addSubview:self.button];
    _button.backgroundColor = [UIColor redColor];
    [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
    
    [leftbutton setBackgroundColor:[UIColor greenColor]];
    
    [leftbutton setTitle:@"保存" forState:UIControlStateNormal];
    
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    self.navigationItem.rightBarButtonItem=rightitem;
    [leftbutton addTarget:self action:@selector(ceshiClick) forControlEvents:UIControlEventTouchUpInside];

    
}




- (void)ceshiClick {
    
    TwoViewController *vc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnClick {
    
    
//    MYPopupView *popupView = [[MYPopupView alloc]initWithTitle:@"测试点击弹窗"
//                                                CancelButton:@"取消"
//                                                OkButton:@"立即开通"
//                                                ImageName:@"loan_eqbX"];
    
//    MYPopupView *popupView = [[MYPopupView alloc]initWithTarget:self];
//    popupView.delegate = self;
    
    DDEqbView *eqbview = [[DDEqbView alloc] init];
    
}

#pragma mark - PopViewDelegate
- (void)MYPopupView:(MYPopupView *)PopupView didClickButtonAtIndex:(NSUInteger)index
{
    if (index == 1)  return;
    
    UIViewController *openLDAccountVC = [[UIViewController alloc]init];
    [self.navigationController pushViewController:openLDAccountVC animated:YES];
}



/*
 viewDidLoad
 viewWillAppear
 viewSafeAreaInsetsDidChange（NEW）
 viewWillLayoutSubviews
 viewDidAppear
 */

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    
    if (@available(iOS 11.0, *)) {
        //        self.tableview.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        
        self.additionalSafeAreaInsets = UIEdgeInsetsMake(255, 0, 0, 0);
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
- (void)safeAreaInsets {
    UITableViewController *tabvc = [[UITableViewController alloc] init];
    
    tabvc.view.backgroundColor = [UIColor orangeColor];
    if (@available(iOS 11.0, *)) {
        tabvc.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 35, 0);
    } else {
        // Fallback on earlier versions
    }
    
    [self.navigationController pushViewController:tabvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
