//
//  UILabel+CountDown.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/8/31.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (CountDown)

/**
 倒计时
 
 @param seconds seconds
 @param title 标题
 @param completion 倒计时之后回调
 */
- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                        countDownTitle:(NSString *)title
                            completion:(void (^)(void))completion;

/**
 *  倒计时按钮
 *
 *  @param seconds 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param titleTextColor   还没倒计时的颜色
 *  @param countDownTitleTextColor    倒计时中的颜色
 */
- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                        titleTextColor:(UIColor *)titleTextColor
               countDownTitleTextColor:(UIColor *)countDownTitleTextColor;

/**
 *  倒计时按钮
 *
 *  @param seconds 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param titleBackgroundColor   还没倒计时的颜色
 *  @param countDownTitleBackgroundColor    倒计时中的颜色
 */
- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                  titleBackgroundColor:(UIColor *)titleBackgroundColor
         countDownTitleBackgroundColor:(UIColor *)countDownTitleBackgroundColor;


@end

NS_ASSUME_NONNULL_END
