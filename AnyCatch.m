//
//  AnyCatch.m
//  消息转发
//
//  Created by gaozhihong on 2017/8/25.
//  Copyright © 2017年 gaozhihong. All rights reserved.
//

#import "AnyCatch.h"
#import <objc/runtime.h>
@implementation AnyCatch

+(instancetype)catch{
    return [[self alloc]init ];
};

void dynamicMethod(){

}
 /** 动态添加方法 */
+(BOOL)resolveInstanceMethod:(SEL)sel{
    class_addMethod([self class], sel, (IMP)dynamicMethod, "v@:");
    return YES;
}
@end
