//
//  SIMacro.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#ifndef GCDSharedInstance
#define GCDSharedInstance(block) \
{ \
static dispatch_once_t predicate = 0; \
static id sharedInstance = nil; \
dispatch_once(&predicate, ^{ sharedInstance = block(); }); \
return sharedInstance; \
}
#endif

#ifndef GCDExecOnce
#define GCDExecOnce(block) \
{ \
static dispatch_once_t predicate = 0; \
dispatch_once(&predicate, block); \
}
#endif

// Block
#define GCDBackground(block)          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDMain(block)                dispatch_async(dispatch_get_main_queue(),block)
#define GCDAfter(sec, block)          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), dispatch_get_main_queue(), block)
#define GCDOnce(block)                static dispatch_once_t onceToken; dispatch_once(&onceToken, block);
#define GCDSyncQueue(Queue, block)       dispatch_sync(Queue, block)
#define GCDAsyncQueue(Queue, block)      dispatch_async(Queue, block)
#define GCDGlobalQueue(block)            Async_Queue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
