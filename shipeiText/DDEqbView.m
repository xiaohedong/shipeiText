//
//  DDEqbView.m
//  ump_xxx1.0
//
//  Created by hongbaodai on 2017/12/11.
//  Copyright © 2017年 李先生. All rights reserved.
//
// RGB转换成UIColor
#define DDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define eqbviewW         307
#define eqbviewH         372

#import "DDEqbView.h"
#import "Masonry.h"

@interface DDEqbView()

@property (strong,nonatomic)UIView * backgroundview;
@property (strong,nonatomic)UIView * popview;
@property (nonatomic, strong) UIImageView *imgview;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancleBtn;

@end

@implementation DDEqbView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUpCoverView];
        //        [self setUpPopView];
        
        [self.popview addSubview:self.imgview];
        [self.popview addSubview:self.label1];
        [self.popview addSubview:self.label2];
        [self.popview addSubview:self.okButton];
        [self.popview addSubview:self.cancleBtn];
        
        [self show];
    }
    return self;
}
- (void)setUpCoverView{
    
    self.backgroundview = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].frame];
    self.backgroundview.backgroundColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:0.55];
    [self addSubview:self.backgroundview];
    
    self.popview = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/2 - 202, 300, 372)];
    self.popview.layer.cornerRadius = 6;
    self.popview.backgroundColor = [UIColor whiteColor];
    [self.backgroundview addSubview:self.popview];

    UIView *upview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 162)];
    upview.backgroundColor = [UIColor orangeColor];
    [self.popview addSubview:upview];
}




- (void)show
{
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
    UISnapBehavior * sanp = [[UISnapBehavior alloc] initWithItem:self.popview snapToPoint:self.center];
    sanp.damping = 0.7;
    [self.window addSubview:self.popview];
}


//// 重写这个方法,视图基于自动布局的
//+ (BOOL)requiresConstraintBasedLayout {
//    return YES;
//}
//
//// 苹果推荐 约束、增加和修改 放在此方法中
//- (void)updateConstraints {
//    [super updateConstraints];
//
//    [_imgview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.popview).offset(33);
//        make.centerX.mas_equalTo(self.popview);
//        make.width.mas_equalTo(208);
//        make.height.mas_equalTo(31);
//    }];
//
//    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_imgview.mas_bottom).offset(33);
//        make.centerX.mas_equalTo(self.popview);
//    }];
//
//    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_label1.mas_bottom).offset(74);
//        make.centerX.mas_equalTo(self.popview);
//        make.width.mas_equalTo(226);
//    }];
//
//    [_okButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_label2.mas_bottom).offset(66);
//        make.left.mas_equalTo(self.popview).offset(10);
//        make.right.mas_equalTo(self.popview).offset(-10);
//        make.height.mas_equalTo(42);
//    }];
//
//    [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.popview).offset(eqbviewH +27);
//        make.centerX.mas_equalTo(self.popview);
//        make.width.mas_equalTo(25);
//        make.height.mas_equalTo(25);
//    }];
//}




- (UIImageView *)imgview {
    if (_imgview == nil) {
        _imgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 33,208,31)];
        _imgview.image = [UIImage imageNamed:@"loan_eqb"];
    }
    return _imgview;
}

- (UILabel *)label1 {
    if (_label1 == nil) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"积极响应国家政策，保障电子合同的合法性。";
        _label1.font = [UIFont systemFontOfSize:14];
        _label1.textColor = [UIColor blackColor];
    }
    return _label1;
}

- (UILabel *)label2 {
    if (_label2 == nil) {
        _label2 = [[UILabel alloc] init];
        _label2.text = @"请开通e签宝账户，开通后您的实名认证信息将作为电子合同签署人。";
        _label2.numberOfLines = 2;
        _label2.font = [UIFont systemFontOfSize:14];
        _label2.textColor = [UIColor blackColor];
    }
    return _label2;
}

- (UIButton *)okButton {
    if (_okButton == nil) {
        _okButton = [[UIButton alloc] init];
        [_okButton setTitle:@"立即开通" forState:UIControlStateNormal];
        [_okButton setBackgroundColor:[UIColor blueColor]];
        [_okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _okButton.layer.cornerRadius = 4;
        _okButton.layer.masksToBounds = YES;
    }
    return _okButton;
}

- (UIButton *)cancleBtn {
    if (_cancleBtn == nil) {
        _cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, -50, 25, 25)];
        [_cancleBtn setImage:[UIImage imageNamed:@"loan_eqbX"] forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}

- (void)cancelBtnClick {
     NSLog(@"------点击关闭了");
    self.alpha = 0.0;
    [self.popview removeFromSuperview];
    [self.backgroundview removeFromSuperview];
    
}

- (void)okButtonClick {
    NSLog(@"------点击确定了");
    [self.delegate didClickNowOpenBtn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
