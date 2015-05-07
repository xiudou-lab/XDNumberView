//
//  XDNumberView.h
//  NumberTest
//
//  Created by jack on 15/4/9.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDNumberView : UIView
@property (nonatomic,readonly) NSInteger number;
-(void)setNumberWithAnimation:(NSInteger)number;
@end
