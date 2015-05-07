//
//  ViewController.m
//  NumberTest
//
//  Created by jack on 15/4/9.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import "ViewController.h"
#import "XDNumberView.h"

@interface ViewController (){
    XDNumberView *_xdNumberView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    _xdNumberView = [[XDNumberView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 20, 200, 40, 40)];
    [self.view addSubview:_xdNumberView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, 120, 200, 44)];
    [self.view addSubview:button];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(scrambleDigits:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)scrambleDigits:(UIButton*)button{
    [_xdNumberView setNumberWithAnimation:arc4random()%20];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
