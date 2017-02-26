//
//  SIGCDQueue.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIQueue : NSObject

@property (nonatomic,strong,readonly) dispatch_queue_t metaQueue ; ///> 队列原始信息

#pragma mark --- Init

/// 获取主队列,相当于dispatch_get_main_queue()
+ (instancetype)mainQueue ;

/// 获取全局队列,相当于dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
+ (instancetype)globalQueue ;

/// 获取低优先级队列,相当于dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
+ (instancetype)lowPriorityGlobalQueue ;

/// 获取background队列,相当于dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
+ (instancetype)backgroundPriorityGlobalQueue ;

/// 获取高优先级队列,相当于dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)]
+ (instancetype)highPriorityGlobalQueue ;

/// 串行队列,相当于dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)
+ (instancetype)serialQueue ;

/// 并发队列,相当于dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)
+ (instancetype)concurrentQueue ;

/// 默认创建串行队列
- (instancetype)init;


/**
 通过dispatch_queue_t对象初始对象

 @param dispatchQueue A dispatch_queue_t object
 @return SIQueue Object
 */
- (instancetype)initWithDispatchQueue:(dispatch_queue_t)dispatchQueue;

@end
