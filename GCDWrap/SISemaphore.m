//
//  SISemaphore.m
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SISemaphore.h"

@implementation SISemaphore

#pragma mark --- Init

- (instancetype)init{
    return [self initWithValue:0] ;
}

- (instancetype)initWithValue:(long)value{
    return [self initWithDispatchSemaphore:dispatch_semaphore_create(value)] ;
}

- (instancetype)initWithDispatchSemaphore:(dispatch_semaphore_t)dispatchSemaphore{
    if(self = [super init]){
        _metaSemaphore = dispatchSemaphore ;
    }
    return self ;
}

#pragma mark --- Action

- (BOOL)signal {
    return dispatch_semaphore_signal(_metaSemaphore) != 0;
}

- (void)wait {
    dispatch_semaphore_wait(_metaSemaphore,DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(double)seconds {
    return dispatch_semaphore_wait(_metaSemaphore, dispatch_time(DISPATCH_TIME_NOW, (seconds * NSEC_PER_SEC))) == 0;
}

@end
