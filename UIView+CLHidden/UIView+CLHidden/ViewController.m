//
//  ViewController.m
//  UIView+CLHidden
//
//  Created by Apple on 2016/3/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CLHidden.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    view.cl_hidden = YES;
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
