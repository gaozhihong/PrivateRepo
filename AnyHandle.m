//
//  AnyHandle.m
//  消息转发
//
//  Created by gaozhihong on 2017/8/25.
//  Copyright © 2017年 gaozhihong. All rights reserved.
//

#import "AnyHandle.h"
#import "AnyCatch.h"
#define KGesturePrefix @"KGesturePrefix"
@implementation AnyHandle

+(instancetype)sharedHandle{
    return [[self alloc]init];
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    NSString*aSelectorStr = NSStringFromSelector(aSelector);
//    NSLog(@"%@",aSelectorStr);
    if (aSelectorStr == nil) {
        return [AnyCatch catch];
    }
    
    NSRange  gestureRange = [aSelectorStr rangeOfString:KGesturePrefix];
    if (gestureRange.length > 0) {
        if (self.handleBlock) {
            self.handleBlock(aSelectorStr);
        }
    }
    
    return [AnyCatch catch];
    
    
}
@end
