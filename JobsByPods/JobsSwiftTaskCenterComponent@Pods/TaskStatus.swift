#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public enum TaskStatus {
    case expire
    case suspend
    case prepare
    case excute
    case ended
    case background
}
