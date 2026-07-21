//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <TargetConditionals.h>
#import <mach-o/dyld.h>
#import "OCCls.h"
#import <CommonCrypto/CommonCrypto.h>
#if !TARGET_OS_SIMULATOR && __has_include(<UnityFramework/UnityFramework.h>)
/// 只有真机（iPhone / iPad）才加入 Unity
/// https://github.com/JobsKits/JobsDocs/blob/main/iOS相关的文档和资料.md/iOS项目集成Unity.md/iOS项目集成Unity.md
#import <UnityFramework/UnityFramework.h>

/// 将宿主 App 的 Mach-O Header 交给 Unity，必须在首次启动 Runtime 前调用。
NS_INLINE void JobsUnitySetExecuteHeader(UnityFramework *framework) {
    const struct mach_header *executeHeader = _dyld_get_image_header(0);
    if (executeHeader) {
        [framework setExecuteHeader:(const MachHeader *)executeHeader];
    }
}
#endif
