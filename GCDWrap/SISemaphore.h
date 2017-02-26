//
//  SISemaphore.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SISemaphore : NSObject

#pragma mark --- Meta

@property (nonatomic,strong,readonly) dispatch_semaphore_t metaSemaphore ; ///> 原始Semaphore

#pragma mark --- Init

/// 默认初始化 >> dispatch_semaphore_create(0)
- (instancetype)init ;

/// 指定Value初始化 >> dispatch_semaphore_create(value)
- (instancetype)initWithValue:(long)value ;

/// 根据Semaphore初始化 >> dispatch_semaphore_create()
- (instancetype)initWithDispatchSemaphore:(dispatch_semaphore_t)dispatchSemaphore ;

#pragma mark --- Action

/// 发送一个信号 >> dispatch_semaphore_wait()
- (BOOL)signal ;

/// 等待信号 >> dispatch_semaphore_wait()
- (void)wait ;

/// 等待信号 YES:success >> dispatch_semaphore_wait()
- (BOOL)wait:(NSTimeInterval)seconds ;

@end
