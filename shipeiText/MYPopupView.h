//
//  MYPopupView.h
//  实验
//
//  Created by a on 15/9/23.
//  Copyright © 2015年 a. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MYPopupView;
@protocol MYPopupDelegate<NSObject>

@required

- (void)MYPopupView:(MYPopupView *)PopupView didClickButtonAtIndex:(NSUInteger)index;
@end


@interface MYPopupView : UIView

@property (weak,nonatomic) id<MYPopupDelegate> delegate;

- (instancetype)initWithTitle:(NSString *) title CancelButton:(NSString *)cancelButton OkButton:(NSString *)okButton ImageName:(NSString *)ImageName;

- (instancetype)initWithTarget:(UIViewController *)target;

- (void)show;

@end
