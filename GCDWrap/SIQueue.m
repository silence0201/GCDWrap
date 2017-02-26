//
//  SIGCDQueue.m
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIQueue.h"

static SIQueue *mainQueue;
static SIQueue *globalQueue;
static SIQueue *highPriorityGlobalQueue;
static SIQueue *lowPriorityGlobalQueue;
static SIQueue *backgroundPriorityGlobalQueue;

static uint8_t mainQueueMarker[] = {0};

@implementation SIQueue

+ (void)initialize {
    if (self == [SIQueue class]) {
        mainQueue = [[SIQueue alloc] initWithDispatchQueue:dispatch_get_main_queue()];
        globalQueue = [[SIQueue alloc] initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
        highPriorityGlobalQueue = [[SIQueue alloc] initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)];
        lowPriorityGlobalQueue = [[SIQueue alloc] initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)];
        backgroundPriorityGlobalQueue = [[SIQueue alloc] initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)];
        
        [mainQueue setContext:mainQueueMarker forKey:mainQueueMarker];
    }
}


#pragma mark --- Init

- (instancetype)initWithDispatchQueue:(dispatch_queue_t)dispatchQueue{
    if(self = [super init]){
        _metaQueue = dispatchQueue ;
    }
    return self ;
}

- (instancetype)init{
    return [self initWithDispatchQueue:dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)] ;
}

+ (instancetype)mainQueue{
    return mainQueue ;
}

+ (instancetype)globalQueue{
    return globalQueue ;
}

+ (instancetype)lowPriorityGlobalQueue{
    return lowPriorityGlobalQueue ;
}

+ (instancetype)backgroundPriorityGlobalQueue{
    return backgroundPriorityGlobalQueue ;
}

+ (instancetype)highPriorityGlobalQueue{
    return highPriorityGlobalQueue ;
}

+ (instancetype)serialQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)] ;
}

+ (instancetype)concurrentQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)] ;
}

#pragma mark --- Block

- (void)syncBlock:(dispatch_block_t)block{
    dispatch_sync(_metaQueue, block) ;
}

- (void)asyncBlock:(dispatch_block_t)block{
    dispatch_async(_metaQueue, block) ;
}

- (void)afterBlock:(dispatch_block_t)block delay:(NSTimeInterval)seconds{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds * NSEC_PER_SEC)),_metaQueue, block);
}

- (void)applyBlock:(void (^)(size_t))block iterationCount:(size_t)count{
    dispatch_apply(count, _metaQueue, block) ;
}

- (void)asyncBarrierBlock:(dispatch_block_t)block{
    dispatch_barrier_async(_metaQueue, block) ;
}

- (void)syncBarrierBlock:(dispatch_block_t)block{
    dispatch_barrier_sync(_metaQueue, block) ;
}

#pragma mark -- suspend / resume

- (void)suspend{
    dispatch_suspend(_metaQueue) ;
}

- (void)resume{
    dispatch_suspend(_metaQueue) ;
}

#pragma mark --- Main

+ (BOOL)isMainQueue{
    return dispatch_get_specific(mainQueueMarker) == mainQueueMarker ;
}

#pragma mark -- Context Associated

- (void)setContext:(void *)context forKey:(const void *)key {
    dispatch_queue_set_specific(_metaQueue, key, context, NULL);
}

- (void *)contextForKey:(const void *)key{
    return dispatch_get_specific(key); ;
}

@end
