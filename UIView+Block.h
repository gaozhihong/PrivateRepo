//
//  UIView+Block.h
//  消息转发
//
//  Created by gaozhihong on 2017/8/25.
//  Copyright © 2017年 gaozhihong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Block)
 /** 添加手势 */
-(void)addGesture:(UIGestureRecognizer *)gesture handleBlock:(void(^)(id obj))handleBlock;
  /** 移除手势 */
-(void)removeGesture:(UITapGestureRecognizer*)gesture handleBlock:(void(^)(id  obj)) handleBlock;

@end
