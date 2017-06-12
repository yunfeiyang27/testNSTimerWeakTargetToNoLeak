//
//  DemoViewController.m
//  testNSThread
//
//  Created by leihuan on 17/6/12.
//  Copyright © 2017年 leihuan. All rights reserved.
//

#import "DemoViewController.h"
#import "LHWeakTarget.h"

@interface DemoViewController ()
@property (nonatomic, weak) NSTimer *timer;
@end


@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _timer = [LHWeakTarget scheduledTimerWithTimeInterval:3.0f
//                                              target:self
//                                            selector:@selector(timerFire:)
//                                            userInfo:nil
//                                             repeats:YES];
    // 使用block
    _timer = [LHWeakTarget scheduledTimerWithTimeInterval:3.0f block:^(id userInfo) {
        
        NSLog(@"%@", userInfo);
        
    } userInfo:@"Fire" repeats:YES];
    
    [_timer fire];
}

-(void)timerFire:(id)userinfo {
    NSLog(@"Fire");
}

-(void)dealloc {
    [_timer invalidate];
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (IBAction)ButtonClick:(id)sender {
    [_timer invalidate];
}
@end
