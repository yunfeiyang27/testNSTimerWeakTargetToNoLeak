//
//  LHWeakTarget.m
//  testNSThread
//
//  Created by leihuan on 17/6/12.
//  Copyright © 2017年 leihuan. All rights reserved.
//

#import "LHWeakTarget.h"

@implementation LHWeakTarget

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats {
    
    LHWeakTarget *timerTarget = [[LHWeakTarget alloc] init];
    timerTarget.customtarget = aTarget;
    timerTarget.customselector = aSelector;
    timerTarget.customtimer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    return timerTarget.customtimer;
}

- (void) fire:(NSTimer *)timer {
    if(self.customtarget) {
        [self.customtarget performSelector:self.customselector withObject:timer.userInfo];
    } else {
        [self.customtimer invalidate];
    }
}

// 使用block
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(LHTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(_timerBlockInvoke:)
                                       userInfo:@[[block copy], userInfo]
                                        repeats:repeats];
}

+ (void)_timerBlockInvoke:(NSArray*)userInfo {
    LHTimerHandler block = userInfo[0];
    id info = userInfo[1];
    // or `!block ?: block();` @sunnyxx
    if (block) {
        block(info);
    }
}
@end
