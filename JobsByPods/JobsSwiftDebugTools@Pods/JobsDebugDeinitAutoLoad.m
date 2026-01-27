//
//  JobsDebugDeinitAutoLoad.m
//  Pods
//
//  Created by Jobs on 27/1/26.
//

@import Foundation;
@import UIKit;
@import JobsSwiftDebugTools;
/// 将此文件集成到主工程
@interface JobsDebugDeinitAutoLoad : NSObject

@end

@implementation JobsDebugDeinitAutoLoad

+ (void)load {
#if DEBUG
    [JobsDebugDeinitAutoSwizzle start];
#endif
}

@end
