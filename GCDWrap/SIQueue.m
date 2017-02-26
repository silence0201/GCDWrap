//
//  SIGCDQueue.m
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIQueue.h"

@implementation SIQueue

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
    return [[self alloc]initWithDispatchQueue:dispatch_get_main_queue()] ;
}

+ (instancetype)globalQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)] ;
}

+ (instancetype)lowPriorityGlobalQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)] ;
}

+ (instancetype)backgroundPriorityGlobalQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)] ;
}

+ (instancetype)highPriorityGlobalQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)] ;
}

+ (instancetype)serialQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)] ;
}

+ (instancetype)concurrentQueue{
    return [[self alloc]initWithDispatchQueue:dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)] ;
}

@end
