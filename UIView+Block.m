//
//  UIView+Block.m
//  消息转发
//
//  Created by gaozhihong on 2017/8/25.
//  Copyright © 2017年 gaozhihong. All rights reserved.
//

#import "UIView+Block.h"
#import "AnyHandle.h"
#import <objc/runtime.h>
#define KGesturePrefix @"KGesturePrefix"

@implementation UIView (Block)



-(void)addGesture:(UIGestureRecognizer *)gesture handleBlock:(void (^)(id))handleBlock{
    
    if (gesture == nil) {
        return;
    }
    AnyHandle *handle  = [AnyHandle sharedHandle];
    NSMutableArray * handlePool = [self getHandlePool:gesture];
    if (handlePool == nil || ![handlePool isKindOfClass:[NSMutableArray class]]) {
         [self setHandlePool:gesture];
        handlePool = [self getHandlePool:gesture];
    }
    [handle setHandleBlock:handleBlock];
     // handel.handleBlock = handleBlock;
    
    [handlePool addObject:handle];
    [self addGestureRecognizer:gesture];
    NSString *seletorStr = [NSString stringWithFormat:@"%@%ld",KGesturePrefix,gesture.hash];
    [gesture addTarget:handle action:NSSelectorFromString(seletorStr)];
    
    
    
}
-(void)removeGesture:(UITapGestureRecognizer *)gesture handleBlock:(void (^)(id))handleBlock{
    NSMutableArray*handlePool = [self getHandlePool:gesture];
    [handlePool removeAllObjects];
    [self removeGestureRecognizer:gesture];
    
}

-(void)setHandlePool:(id)associateObjc{
    NSMutableArray*mutarray = [NSMutableArray array];
    objc_setAssociatedObject(associateObjc, @"associateObjc", mutarray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
};
 /** 操作池/直接搞一个容器 */
-(NSMutableArray*)getHandlePool:(id) associateObjc{
    
    NSMutableArray*mutArray = objc_getAssociatedObject(associateObjc, @"associateObjc");
    return mutArray;
    
};
@end
