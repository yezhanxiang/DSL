//
//  ViewMaker.h
//  DSL
//
//  Created by 展祥叶 on 2017/2/10.
//  Copyright © 2017年 ye zhanxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewMaker : NSObject

@property (nonatomic, strong) Class viewClass;
@property (nonatomic, assign) CGPoint p;
@property (nonatomic, assign) CGSize s;
@property (nonatomic, strong) UIColor *c;
@property (nonatomic, copy) ViewMaker * (^position)(CGFloat x, CGFloat y);
@property (nonatomic, copy) ViewMaker * (^szie)(CGFloat with, CGFloat height);
@property (nonatomic, copy) ViewMaker * (^bgColor)(UIColor *color);
@property (nonatomic, copy) UIView* (^intoView)(UIView *superView);

@end


/**
 * 防止重复使用助词with ，确保每个ViewMaker只提示一个with
 */
@interface ViewClassHelper : NSObject
@property (nonatomic, strong) Class viewClass;
@property (nonatomic, readonly) ViewMaker *with;
+ (instancetype)allocViewWithClass:(Class)aClass;
@end

#define AllocView(aClass)  [ViewClassHelper allocViewWithClass:[aClass class]]

