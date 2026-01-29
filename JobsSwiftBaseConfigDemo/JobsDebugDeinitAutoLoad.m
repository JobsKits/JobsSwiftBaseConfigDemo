//
//  JobsDebugDeinitAutoLoad.m
//  Pods
//
//  Created by Jobs on 27/1/26.
//

@import Foundation;
@import UIKit;
#import <objc/message.h>

@interface JobsDebugDeinitAutoLoad : NSObject

@end

@implementation JobsDebugDeinitAutoLoad

+ (void)load {
    // 不依赖 import / link，Debug 有类就调用，Release 没类就跳过
    Class cls = NSClassFromString(@"JobsDebugDeinitAutoSwizzle");
    SEL sel = NSSelectorFromString(@"start");
    if (cls && [cls respondsToSelector:sel]) {
        ((void (*)(id, SEL))objc_msgSend)(cls, sel);
    }
}

@end
