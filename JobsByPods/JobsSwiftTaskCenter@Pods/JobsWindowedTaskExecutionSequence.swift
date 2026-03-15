//
//  JobsWindowedTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation

public struct JobsWindowedTaskExecutionSequence: AsyncSequence {
    
    public typealias Element = [TaskExecution]
    private let base: JobsTaskExecutionSequence
    private let windowDuration: TimeInterval
    
    init(base: JobsTaskExecutionSequence, windowDuration: TimeInterval) {
        self.base = base
        self.windowDuration = windowDuration
    }
}

extension JobsWindowedTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), windowDuration: windowDuration)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private let windowDuration: TimeInterval
        
        init(base: JobsTaskExecutionSequence.AsyncIterator, windowDuration: TimeInterval) {
            self.base = base
            self.windowDuration = windowDuration
        }
        
        public mutating func next() async -> [TaskExecution]? {
            guard let first = await base.next() else { return nil }
            
            var window: [TaskExecution] = [first]
            let endTime = first.date.addingTimeInterval(windowDuration)
            
            while let execution = await base.next() {
                if execution.date <= endTime {
                    window.append(execution)
                } else {
                    // 下个窗口的第一个元素，暂时无法处理，需要重新设计
                    // 这里简化处理，返回当前窗口
                    break
                }
            };return window.isEmpty ? nil : window
        }
    }
}
