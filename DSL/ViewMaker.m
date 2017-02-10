//
//  ViewMaker.m
//  DSL
//
//  Created by 展祥叶 on 2017/2/10.
//  Copyright © 2017年 ye zhanxiang. All rights reserved.
//

#import "ViewMaker.h"

#define WEAK_SELF   __weak typeof(self) weakSelf = self;
#define STRONG_SELF   __strong typeof(weakSelf) strongSelf = weakSelf;

@implementation ViewMaker

- (instancetype)init
{

    if (self = [super init]) {
            WEAK_SELF
        _position = ^ViewMaker *(CGFloat x, CGFloat y) {
            STRONG_SELF
            strongSelf.p = CGPointMake(x, y);
            return strongSelf;
        };
        
        _szie = ^ViewMaker *(CGFloat with, CGFloat height) {
            STRONG_SELF
            strongSelf.s = CGSizeMake(with, height);
            return strongSelf;
        };
        
        _bgColor = ^ViewMaker *(UIColor *color) {
            STRONG_SELF
            strongSelf.c = color;
            return strongSelf;
        };
        
        _intoView = ^UIView *(UIView *superView) {
            STRONG_SELF
            CGRect rect = CGRectMake(strongSelf.p.x, strongSelf.p.y, strongSelf.s.width, strongSelf.s.height);
             UIView *view = [strongSelf.viewClass new];
            view.frame = rect;
            view.backgroundColor = strongSelf.c;
            [superView addSubview:view];
            return view;
        };
        
    }
    return self;
}

@end

@implementation ViewClassHelper

+ (instancetype)allocViewWithClass:(Class)aClass
{
    ViewClassHelper *helper = ViewClassHelper.new;
    helper.viewClass = aClass;
    return helper;
}

- (ViewMaker *)with
{
    ViewMaker *maker = ViewMaker.new;
    maker.viewClass = self.viewClass;
    return maker;
}


@end

