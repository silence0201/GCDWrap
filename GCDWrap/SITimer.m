//
//  SITimer.m
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SITimer.h"
#import "SIQueue.h"

@implementation SITimer

- (instancetype)init{
    return [self initInQueue:[SIQueue globalQueue]] ;
}

- (instancetype)initInQueue:(SIQueue *)queue{
    if (self = [super init]) {
        _metaSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue.metaQueue) ;
    }
    return self ;
}

- (void)timerExecute:(dispatch_block_t)block timeInterval:(uint64_t)interval{
    dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    dispatch_source_set_event_handler(_metaSource, block);
}

- (void)timerExecute:(dispatch_block_t)block timeInterval:(uint64_t)interval delay:(uint64_t)delay{
    dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, delay), interval, 0);
    dispatch_source_set_event_handler(_metaSource, block);
}

- (void)timerExecute:(dispatch_block_t)block timeIntervalWithSecs:(float)secs{
    dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, 0), secs * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_metaSource, block);
}

- (void)timerExecute:(dispatch_block_t)block timeIntervalWithSecs:(float)secs delaySecs:(float)delaySecs{
    dispatch_source_set_timer(_metaSource, dispatch_time(DISPATCH_TIME_NOW, delaySecs * NSEC_PER_SEC), secs * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_metaSource, block);
}

- (void)start{
    if(_isRuning ) return ;
    dispatch_resume(_metaSource);
    _isRuning = YES ;
}

- (void)resume{
    if(_isRuning) return ;
    dispatch_resume(_metaSource);
    _isRuning = YES ;
}

- (void)pause{
    if (!_isRuning)  return ;
    dispatch_suspend(_metaSource);
    _isRuning = NO ;
}

- (void)destroy{
    dispatch_source_cancel(_metaSource) ;
}

@end
