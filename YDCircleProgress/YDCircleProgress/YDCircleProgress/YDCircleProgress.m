//
//  YDCircleProgress.m
//  Jumper
//
//  Created by 司亚冰 on 2017/5/13.
//  Copyright © 2017年 SP. All rights reserved.
//

#import "YDCircleProgress.h"
#import "YDCountLabel.h"
// 获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define CircleWidth  10
@interface YDCircleProgress()
{
   
    CAShapeLayer *_progressLayer;
    CGFloat _radius;
    CGFloat _centerX;
    CGFloat _centerY;
    
}
@property (nonatomic,strong) YDCountLabel *scoreLB;

@end

@implementation YDCircleProgress

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _radius = (frame.size.width - CircleWidth)/2;
        _centerX = frame.size.width/2;
        _centerY = frame.size.height/2;
        [self drawBackgroundCircleView];
        [self drawProgressCircleView];
        [self addSubview:self.scoreLB];
    }
    return self;
}
//绘制背景圆环
- (void)drawBackgroundCircleView
{
     UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_centerX, _centerY) radius:_radius startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES];
    
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.path = path.CGPath;
    backLayer.strokeColor = IWColor(221, 234, 240).CGColor;
    backLayer.fillColor = [UIColor clearColor].CGColor;
    backLayer.lineWidth = CircleWidth;
    backLayer.strokeEnd = 1;
    [self.layer  addSublayer:backLayer];
    
}
//绘制进度圆环
- (void)drawProgressCircleView
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_centerX, _centerY) radius:_radius startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES];

    //创建进度layer
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    //指定path的渲染颜色
    _progressLayer.strokeColor  = [[UIColor blackColor] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = CircleWidth;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeStart = 0;
    //设置渐变颜色
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[IWColor(48, 159, 217) CGColor],(id)[IWColor(166, 234, 240) CGColor], nil]];
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];

}
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _progressLayer.strokeEnd = _progress/100.0;
    [self.scoreLB countFrom:0 to:_progress withDuration:5 * _progress/100.0];

    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 5 * _progress/100.0;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:_progress/100.0];
    [_progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];

}


- (YDCountLabel *)scoreLB
{
    if (!_scoreLB) {
        
        _scoreLB = [YDCountLabel new];
        _scoreLB.format = @"%d";
        _scoreLB.font = [UIFont systemFontOfSize:40];
        _scoreLB.adjustsFontSizeToFitWidth = YES;
        _scoreLB.textAlignment = NSTextAlignmentCenter;
        _scoreLB.frame = self.bounds;
        _scoreLB.textColor = IWColor(48, 159, 217);
        _scoreLB.center = CGPointMake(_centerX, _centerY);
    }
    return _scoreLB;
}

@end
