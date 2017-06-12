//
//  LHWeakTarget.h
//  testNSThread
//
//  Created by leihuan on 17/6/12.
//  Copyright © 2017年 leihuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LHTimerHandler)(id userInfo);

@interface LHWeakTarget : NSObject
@property (nonatomic, weak) id customtarget;
@property (nonatomic, assign) SEL customselector;
@property (nonatomic, weak) NSTimer* customtimer;

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

- (void) fire:(NSTimer *)timer;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(LHTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;
@end
