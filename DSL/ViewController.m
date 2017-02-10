//
//  ViewController.m
//  DSL
//
//  Created by 展祥叶 on 2017/2/10.
//  Copyright © 2017年 ye zhanxiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *view = (UIButton *)AllocView(UIButton)
                            .with
                            .position(0,50)
                            .szie(100,100)
                            .bgColor([UIColor redColor])
                            .intoView(self.view);
    
    [view setTitle:@"哈哈" forState:UIControlStateNormal];
    [view setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addTarget:self action:@selector(say) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)say
{
    NSLog(@"hello, world");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
