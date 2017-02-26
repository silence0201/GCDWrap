//
//  SIGroup.m
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIGroup.h"

@implementation SIGroup

#pragma mark --- Init

- (instancetype)init{
    return [self initWithDispatchGroup:dispatch_group_create()] ;
}

- (instancetype)initWithDispatchGroup:(dispatch_group_t)dispatchGroup{
    if(self = [super init]){
        _metaGroup = dispatchGroup ;
    }
    return self ;
}

#pragma mark --- Action

- (void)enter {
    dispatch_group_enter(_metaGroup);
}

- (void)leave {
    dispatch_group_leave(_metaGroup);
}

- (void)wait {
    dispatch_group_wait(_metaGroup, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(double)seconds {
    return dispatch_group_wait(_metaGroup, dispatch_time(DISPATCH_TIME_NOW, (seconds * NSEC_PER_SEC))) == 0;
}

@end
