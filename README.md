# testNSTimerWeakTargetToNoLeak
想让这个 NSTimer 一直输出，直到 DemoViewController 销毁了才停止。而 self 被 NSTimer 强引用了，如果我们能打破这个强引用问题自然而然就解决了。
解决方案：
我们可以造个假的 target 给 NSTimer 。这个假的 target 类似于一个中间的代理人，它做的唯一的工作就是挺身而出接下了 NSTimer 的强引用。
