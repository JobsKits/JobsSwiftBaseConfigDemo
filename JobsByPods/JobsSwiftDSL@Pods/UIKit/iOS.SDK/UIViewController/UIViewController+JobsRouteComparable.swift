import UIKit
import JobsSwiftBaseDefines

extension UIViewController: @retroactive JobsRouteComparable {
    @inline(__always)
    public func jobs_isSameDestination(as other: UIViewController) -> Bool {
        type(of: self) == type(of: other)
    }
}
