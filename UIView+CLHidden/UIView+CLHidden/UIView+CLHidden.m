//
//  UIView+CLHidden.m
//  ViewHidden
//
//  Created by Apple on 2016/3/21.
//  Copyright © 2016年 luckyncl. All rights reserved.
//

#import "UIView+CLHidden.h"
#import <objc/runtime.h>

@implementation NSLayoutConstraint (_CLOriginalConstantStorage)

- (void)setCl_originalConstant:(CGFloat)originalConstant
{
    // 绑定 原始约束
    objc_setAssociatedObject(self, @selector(cl_originalConstant), @(originalConstant), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)cl_originalConstant
{
#if CGFLOAT_IS_DOUBLE
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
#else
    return [objc_getAssociatedObject(self, _cmd) floatValue];
    
#endif
}

@end

@implementation UIView (CLHidden)


- (BOOL)cl_hidden
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCl_hidden:(BOOL)cl_hidden
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"secondAttribute = 0"];
    
    NSArray *arr = [self.constraints filteredArrayUsingPredicate:predicate];
    
    for (NSLayoutConstraint *constraint in arr) {
        if (constraint.cl_originalConstant == 0) {
            constraint.cl_originalConstant = constraint.constant;
        }
        constraint.constant = cl_hidden ? 0 : constraint.cl_originalConstant;
    }
    
    objc_setAssociatedObject(self, @selector(cl_hidden), @(cl_hidden), OBJC_ASSOCIATION_RETAIN);
}

@end
