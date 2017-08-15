//
//  SIGroup.h
//  GCDWrap
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIGroup : NSObject

#pragma mark --- Meta

@property (nonatomic,strong,readonly) dispatch_group_t metaGroup ; ///> 原始Group信息

#pragma mark --- Init

/// 初始化 >> dispatch_group_create()
- (instancetype)init ;

/// 初始化 >> dispatchGroup
- (instancetype)initWithDispatchGroup:(dispatch_group_t)dispatchGroup ;

#pragma mark --- Action

/// enter >> dispatch_group_enter()
- (void)enter ;

/// leave >> dispatch_group_leave()
- (void)leave ;

/// wait >> dispatch_group_wait()
- (void)wait ;

/// 在指定的时间内完成Block YES表示所有的Block执行完成 >> dispatch_group_wait()
- (BOOL)wait:(NSTimeInterval)seconds ;

@end
