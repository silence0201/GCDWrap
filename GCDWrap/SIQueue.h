//
//  SIGCDQueue.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SIGroup ;
@interface SIQueue : NSObject

#pragma mark --- Meta

@property (nonatomic,strong,readonly) dispatch_queue_t metaQueue ; ///> 队列原始信息

#pragma mark --- Init

/// 获取主队列 >> dispatch_get_main_queue()
+ (instancetype)mainQueue ;

/// 获取全局队列 >> dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
+ (instancetype)globalQueue ;

/// 获取低优先级队列 >> dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
+ (instancetype)lowPriorityGlobalQueue ;

/// 获取background队列 >> dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
+ (instancetype)backgroundPriorityGlobalQueue ;

/// 获取高优先级队列 >> dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)]
+ (instancetype)highPriorityGlobalQueue ;

/// 串行队列 >> dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)
+ (instancetype)serialQueue ;

/// 并发队列 >> dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)
+ (instancetype)concurrentQueue ;

/// 默认创建串行队列
- (instancetype)init;


/// 通过dispatch_queue_t对象初始对象
- (instancetype)initWithDispatchQueue:(dispatch_queue_t)dispatchQueue;

#pragma mark --- Block

/// 同步执行,相当于dispatch_sync()
- (void)syncBlock:(dispatch_block_t)block ;

/// 异步执行,相当于dispatch_async()
- (void)asyncBlock:(dispatch_block_t)block ;

/// 在指定时间后异步执行,相当于dispatch_after()
- (void)afterBlock:(dispatch_block_t)block delay:(NSTimeInterval)seconds ;

/// 提交一个block块到一个分发的队里,以供多次调用,相当于dispatch_apply()
- (void)applyBlock:(void (^)(size_t))block iterationCount:(size_t)count ;

/// 异步栅栏函数,相当于dispatch_barrier_async
- (void)asyncBarrierBlock:(dispatch_block_t)block ;

/// 同步栅栏函数,相当于dispatch_barrier_async
- (void)syncBarrierBlock:(dispatch_block_t)block ;

#pragma mark --- Group

/// Block in Group >> dispatch_group_async()
- (void)asyncBlock:(dispatch_block_t)block inGroup:(SIGroup *)group ;

/// Group Notify >> dispatch_group_notify()
- (void)notifyBlock:(dispatch_block_t)block inGroup:(SIGroup *)group ;


#pragma mark -- suspend / resume

/// suspend >> dispatch_suspend()
- (void)suspend ;

/// resume >> dispatch_resume()
- (void)resume ;

#pragma mark --- Main

/// 当前是否是主队列
+ (BOOL)isMainQueue ;

#pragma mark --- Context Associated

/// 返回context associated,相当于dispatch_get_specific()
- (void *)contextForKey:(const void *)key;

/// 设置context associated,相当于dispatch_queue_set_specific()
- (void)setContext:(void *)context forKey:(const void *)key;

@end
