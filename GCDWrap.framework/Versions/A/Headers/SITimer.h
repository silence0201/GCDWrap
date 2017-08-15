//
//  SITimer.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SIQueue ;
@interface SITimer : NSObject

#pragma mark --- Meta

@property (nonatomic,strong,readonly) dispatch_source_t metaSource ;  ///> 原始Source

@property (nonatomic,assign) BOOL isRuning ; ///> 定时器是否在运行

#pragma mark --- Init

/// 在全局队列初始化 >> dispatch_source_create
- (instancetype)init ;

/// 自定义队列初始化 >> dispatch_source_create
- (instancetype)initInQueue:(SIQueue *)queue ;

#pragma mark --- Block

/// 添加Block >> dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
- (void)timerExecute:(dispatch_block_t)block timeInterval:(uint64_t)interval;

/// 添加Block >> dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, delay), interval, 0);
- (void)timerExecute:(dispatch_block_t)block timeInterval:(uint64_t)interval delay:(uint64_t)delay;

/// 添加Block >> dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, 0), secs * NSEC_PER_SEC, 0);
- (void)timerExecute:(dispatch_block_t)block timeIntervalWithSecs:(float)secs;

/// 添加Block >> dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, delaySecs * NSEC_PER_SEC), secs * NSEC_PER_SEC, 0);
- (void)timerExecute:(dispatch_block_t)block timeIntervalWithSecs:(float)secs delaySecs:(float)delaySecs;

#pragma mark --- Action

/// start >> dispatch_resume
- (void)start;

/// resume >> dispatch_resume
- (void)resume;

/// pause >> dispatch_suspend
- (void)pause;

/// destroy >> dispatch_source_cancel
- (void)destroy;

@end
