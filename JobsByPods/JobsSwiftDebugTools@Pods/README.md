# `JobsSwiftDebugTools`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

## 一、介绍

* 用**Toast**的方式来<font color=red>检验目标 **`UIViewController`** 是否释放</font>

* 利用协议挂载，没有入侵性

* 文案有默认值，亦可以在当前**`UIViewController`**中自定义文案

* 不占用当前的 `deinit{/// TODO}`方法

* 只在**Debug**环境下生效，能在**Release**环境下打包

* 第三方引用

  ```ruby
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsToast'
  ```

## 二、使用方式

* 引入框架 <font color=red>**import**</font> `JobsSwiftDebugTools`

* 挂载协议 `JobsDebugDeinitProtocol`

* 挂载 （二选一）

  * **手动集成** ➤ 在`UIViewController`的生命周期中进行注册 `enableDebugDeinitToast()`

  * **方法交换** ➤ 将 `JobsDebugDeinitAutoLoad.m`集成在主工程

    ```objective-c
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
    ```
