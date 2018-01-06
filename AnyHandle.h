//
//  AnyHandle.h
//  消息转发
//
//  Created by gaozhihong on 2017/8/25.
//  Copyright © 2017年 gaozhihong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnyHandle : NSObject

+(instancetype)sharedHandle;
@property(nonatomic,copy)void (^handleBlock)(id objc) ;
@property(nonatomic,strong) id source;



@end
