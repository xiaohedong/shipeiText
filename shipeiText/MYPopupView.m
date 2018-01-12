//
//  MYPopupView.m
//  实验
//
//  Created by a on 15/9/23.
//  Copyright © 2015年 a. All rights reserved.
//

// RGB转换成UIColor
#define DDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "MYPopupView.h"
@interface MYPopupView()
{
    UIViewController *vc;
}
@property (strong,nonatomic)UIView * alertview;
@property (strong,nonatomic)UIView * backgroundview;
@property (strong,nonatomic)NSString * title;
@property (strong,nonatomic)NSString * cancelButtonTitle;
@property (strong,nonatomic)NSString * okButtonTitle;
@property (strong,nonatomic)UILabel * titleLabel;
@property (strong,nonatomic)NSString * ImageName;
@property (strong,nonatomic)UIImageView * Image;
@end

@implementation MYPopupView

- (instancetype)initWithTitle:(NSString *) title CancelButton:(NSString *)cancelButton OkButton:(NSString *)okButton ImageName:(NSString *)ImageName
{
    if (self = [super initWithFrame:[[UIApplication sharedApplication] keyWindow].frame]) {
        self.title = title;
        self.cancelButtonTitle = cancelButton;
        self.okButtonTitle = okButton;
        self.ImageName= ImageName;
        [self setUp];
    }
    return self;
}

- (instancetype)initWithTarget:(UIViewController *)target
{
    if (self = [super initWithFrame:[[UIApplication sharedApplication] keyWindow].frame]) {
        self.title = @"开通实名认证，才能投资哦";
    
        self.cancelButtonTitle = @"取消";
        self.okButtonTitle = @"立即开通";
        self.ImageName =  @"loan_eqb";
        vc = target;
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.backgroundview = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].frame];
    self.backgroundview.backgroundColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:0.55];
    [self addSubview:self.backgroundview];
    
    self.alertview = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/2 - 202, 300, 372)];
    self.alertview.layer.cornerRadius = 6;
    self.alertview.backgroundColor = [UIColor whiteColor];
    [self.backgroundview addSubview:self.alertview];
    
    _Image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 50,self.alertview.frame.size.width,165)];
    _Image.contentMode = UIViewContentModeScaleAspectFit;
    _Image.image = [UIImage imageNamed:@"loan_eqb"];
    _Image.backgroundColor = [UIColor clearColor];
    [self.alertview addSubview:_Image];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(0, 232, CGRectGetWidth(self.alertview.frame), 40);
    _titleLabel.text = self.title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = DDColor(45, 65, 94);
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.alertview addSubview:_titleLabel];
    
    
    CGFloat heightBut = 44.0f;
    CGFloat topBut = CGRectGetHeight(self.alertview.frame) - heightBut - 26.0f;
    CGFloat leftBut = 14;
    CGFloat widthBut =  CGRectGetWidth(self.alertview.frame) - 2 * leftBut;
    UIButton *okButton = [[UIButton alloc]initWithFrame:CGRectMake(leftBut, topBut, widthBut, heightBut)];
    okButton.backgroundColor = DDColor(114, 198, 225);
    [okButton setTitle:self.okButtonTitle forState:UIControlStateNormal];
    okButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    okButton.tag = 2;
    okButton.layer.cornerRadius = 3;
    [okButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertview addSubview:okButton];
    
    CGFloat widLeftBut = 25.0f;
    CGFloat left = CGRectGetMaxX(self.alertview.frame)/2 + widLeftBut;
    CGFloat topLeft = CGRectGetMinY(self.alertview.frame) +self.alertview.bounds.size.height + widLeftBut;
    
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(left, topLeft, widLeftBut, widLeftBut)];
    cancelButton.backgroundColor = [UIColor clearColor];
    [cancelButton setImage:[UIImage imageNamed:@"loan_eqbX"] forState:UIControlStateNormal];
    cancelButton.tag = 1;
    [cancelButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:cancelButton];
    [self show];
}

- (void)click:(UIButton *)but
{
//    [self.delegate MYPopupView:self didClickButtonAtIndex:but.tag];
    
    self.alpha = 0.0;
    [self.alertview removeFromSuperview];
    [self.backgroundview removeFromSuperview];
    
//    if (but.tag != 1) {
//        // 开户
//        UIViewController *opVC = [[UIViewController alloc] init];
//        [vc.navigationController pushViewController:opVC animated:YES];
//    }
}

- (void)show
{
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
    UISnapBehavior * sanp = [[UISnapBehavior alloc] initWithItem:self.alertview snapToPoint:self.center];
    sanp.damping = 0.7;
    [self.window addSubview:self.alertview];
}


@end
