//
//  JobsPeriod+Worker.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTaskCenter

public extension BinaryInteger {
    var milliseconds: JobsPeriod {
        JobsPeriod(Double(Int(self)) / 1_000.0)
    }

    var seconds: JobsPeriod {
        JobsPeriod(Double(Int(self)))
    }
}

public extension BinaryFloatingPoint {
    var milliseconds: JobsPeriod {
        JobsPeriod(Double(self) / 1_000.0)
    }

    var seconds: JobsPeriod {
        JobsPeriod(Double(self))
    }
}
