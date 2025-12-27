//
//  JobsDemoImageURLSwitch.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/23/25.
//

import Foundation

enum JobsDemoImageURLSwitch {
    /// true = 使用“必失败”的 URL（10.255.255.1），false = 使用 picsum
    static var useBadURL: Bool = true
}

enum JobsDemoImageURLProvider {
    static var good_200: String { "https://picsum.photos/200" }
    static var good_400x300: String { "https://picsum.photos/400/300" }
    static var bad_400x300: String { "https://10.255.255.1/400/300.jpg" }
    /// 你提到的这组：picsum(200) vs bad(400x300)
    static var kfButtonFG: String { JobsDemoImageURLSwitch.useBadURL ? bad_400x300 : good_200 }
    /// 页面里大多数用 400x300，统一走这里
    static var common_400x300: String { JobsDemoImageURLSwitch.useBadURL ? bad_400x300 : good_400x300 }
}
