//
//  YDCountLabel.h
//  YDCircleProgress
//
//  Created by 司亚冰 on 2017/5/17.
//  Copyright © 2017年 SP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString* (^UICountingLabelFormatBlock)(CGFloat);
typedef NSAttributedString* (^UICountingLabelAttributedFormatBlock)(CGFloat value);

@interface YDCountLabel : UILabel

@property (nonatomic, strong) NSString *format;
@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, copy) UICountingLabelFormatBlock formatBlock;
@property (nonatomic, copy) UICountingLabelAttributedFormatBlock attributedFormatBlock;
@property (nonatomic, copy) void (^completionBlock)();

-(void)countFrom:(CGFloat)startValue to:(CGFloat)endValue;
-(void)countFrom:(CGFloat)startValue to:(CGFloat)endValue withDuration:(NSTimeInterval)duration;

-(void)countFromCurrentValueTo:(CGFloat)endValue;
-(void)countFromCurrentValueTo:(CGFloat)endValue withDuration:(NSTimeInterval)duration;

-(void)countFromZeroTo:(CGFloat)endValue;
-(void)countFromZeroTo:(CGFloat)endValue withDuration:(NSTimeInterval)duration;

- (CGFloat)currentValue;

@end
