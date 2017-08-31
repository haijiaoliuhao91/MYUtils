//
//  UILabel+FitLines.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FitLines)

/**
 最大显示宽度
 */
@property (nonatomic, assign) CGFloat myConstrainedWidth;


/**
 行间距
 */
@property (nonatomic, assign) CGFloat myLineSpacing;


/**
 文本适应于指定的行数
 @return 文本是否被numberOfLines限制
 */
- (BOOL)my_adjustTextToFitLines:(NSInteger)numberOfLines;

/**
 倒计时
 
 @param seconds seconds
 @param title 标题
 @param completion 倒计时之后回调
 */
- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                        countDownTitle:(NSString *)title
                            completion:(void (^)(void))completion;

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                             mainColor:(UIColor *)mColor
                            countColor:(UIColor *)color;

@end
