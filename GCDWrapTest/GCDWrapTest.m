//
//  GCDWrapTest.m
//  GCDWrapTest
//
//  Created by 杨晴贺 on 26/02/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <libkern/OSAtomic.h>
#import "GCDWrap.h"

@interface GCDWrapTest : XCTestCase

@end

@implementation GCDWrapTest

- (void)testMainQueue{
    XCTAssertEqual([SIQueue mainQueue].metaQueue, dispatch_get_main_queue()) ;
    
    XCTAssertTrue([SIQueue isMainQueue]) ;
    [[SIQueue globalQueue] syncBlock:^{
        XCTAssertFalse([SIQueue isMainQueue]) ;
    }] ;
}

- (void)testGlobalQueue{
    XCTAssertEqual([SIQueue globalQueue].metaQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    XCTAssertEqual([SIQueue highPriorityGlobalQueue].metaQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));
    XCTAssertEqual([SIQueue lowPriorityGlobalQueue].metaQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0));
    XCTAssertEqual([SIQueue backgroundPriorityGlobalQueue].metaQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0));
}

- (void)testQueueBlockInGroup {
    SIQueue *queue = [SIQueue concurrentQueue] ;
    SIGroup *group = [[SIGroup alloc]init] ;
    
    for (int i = 0; i < 100; ++i) {
        [queue asyncBlock:^{ NSLog(@"%lf",[[NSDate date]timeIntervalSince1970]) ; } inGroup:group];
    }
    [queue notifyBlock:^{NSLog(@"Notify") ;} inGroup:group] ;
}

- (void)testApplyBlockQueue{
    SIQueue *queue = [SIQueue concurrentQueue] ;
    [queue applyBlock:^(size_t i) {
        NSLog(@"%zu",i) ;
    } iterationCount:100] ;
}

- (void)testMacro{
    GCDMain(^{
            XCTAssertTrue([SIQueue isMainQueue]) ;
        }
    ) ;
}

@end
