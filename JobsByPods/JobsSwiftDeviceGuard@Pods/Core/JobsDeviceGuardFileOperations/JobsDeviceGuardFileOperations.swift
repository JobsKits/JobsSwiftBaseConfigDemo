//
//  JobsDeviceGuardFileOperations.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Darwin

/// 内部注入边界用于验证创建失败和清理失败；宿主不接触测试替身。
struct JobsDeviceGuardFileOperations {

    var openExclusive: (String) -> Int32
    var closeDescriptor: (Int32) -> Int32
    var removePath: (String) -> Int32
    var errorCode: () -> Int32

    static var live: Self {
        Self(openExclusive: { path in
            Darwin.open(path,
                        O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW,
                        mode_t(S_IRUSR | S_IWUSR))
        },
             closeDescriptor: Darwin.close,
             removePath: { path in
            Darwin.unlink(path)
        },
             errorCode: {
            errno
        })
    }
}
