//
//  DDEqbView.h
//  ump_xxx1.0
//
//  Created by hongbaodai on 2017/12/11.
//  Copyright © 2017年 李先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDEqbViewDelegate <NSObject>
@optional
//
- (void)didClickCancelBtnBtn;

- (void)didClickNowOpenBtn;

@end

@interface DDEqbView : UIView
@property (nonatomic, weak) id<DDEqbViewDelegate>delegate;

@end



