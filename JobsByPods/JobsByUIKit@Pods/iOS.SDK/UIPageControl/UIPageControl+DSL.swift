//
//  UIPageControl.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/16.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UIPageControl {
    @discardableResult
    public func byNumberOfPages(_ count: Int) -> Self {
        self.numberOfPages = count
        return self
    }

    @discardableResult
    public func byCurrentPage(_ page: Int) -> Self {
        self.currentPage = page
        return self
    }

    @discardableResult
    public func byPageIndicatorTintColor(_ color: UIColor) -> Self {
        self.pageIndicatorTintColor = color
        return self
    }

    @discardableResult
    public func byCurrentPageIndicatorTintColor(_ color: UIColor) -> Self {
        self.currentPageIndicatorTintColor = color
        return self
    }
}
