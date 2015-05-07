//
//  XDNumberView.m
//  NumberTest
//
//  Created by jack on 15/4/9.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import "XDNumberView.h"

#define DURATION 0.2f

@interface XDNumberView(){
    UILabel *_numberLabel;
}
@end

@implementation XDNumberView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = frame.size.height / 2;
        self.layer.borderWidth = 0.0;
        [self.layer setMasksToBounds:YES];
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.font = [UIFont boldSystemFontOfSize:frame.size.width / 2];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        CGAffineTransform transform = self.transform;
        transform = CGAffineTransformScale(transform, 0.1, 0.1);
        self.transform = transform;
        [_numberLabel setHidden:YES];
        [self addSubview:_numberLabel];
        [self setHidden:YES];
    }
    return self;
}

-(void)setNumberWithAnimation:(NSInteger)number{
    NSLog(@"%lu",number);
    if (number == 0) {
        if (_number != 0) {
            [UIView animateWithDuration:DURATION
                             animations:^{
                                 CGAffineTransform transform = self.transform;
                                 transform = CGAffineTransformScale(transform, 0.1, 0.1);
                                 self.transform = transform;
                                 self.alpha = 0;
                             }
                             completion:^(BOOL finished) {
                                 if (finished) {
                                     [self setHidden:YES];
                                     [_numberLabel setHidden:YES];
                                     _number = number;
                                     _numberLabel.text = @(_number).stringValue;
                                 }
                             }];
        }
    } else {
        if (_number == 0) {
            [self setHidden:NO];
            [_numberLabel setHidden:NO];
            [UIView animateWithDuration:DURATION
                             animations:^{
                                 CGAffineTransform transform = self.transform;
                                 transform = CGAffineTransformScale(transform, 10, 10);
                                 self.transform = transform;
                                 self.alpha = 1;
                             }
                             completion:^(BOOL finished) {
                                 if (finished) {
                                     _number = number;
                                     _numberLabel.text = @(_number).stringValue;
                                 }
                             }];
        } else {
            _number = number;
            _numberLabel.text = @(_number).stringValue;
            CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            theAnimation.duration = DURATION;
            theAnimation.removedOnCompletion = YES;
            theAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            theAnimation.toValue = [NSNumber numberWithFloat:M_PI];
            [_numberLabel.layer addAnimation:theAnimation forKey:@"animateTransform"];
            
        }
        
    }
}

@end
