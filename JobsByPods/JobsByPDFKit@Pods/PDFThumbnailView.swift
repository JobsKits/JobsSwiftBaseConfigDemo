//
//  PDFThumbnailView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/1/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import PDFKit

extension PDFThumbnailView {
    @discardableResult
    public func byPDFView(to pdfView: PDFView) -> Self {
        self.pdfView = pdfView;
        return self
    }
    @discardableResult
    public func byLayoutMode(_ mode: PDFThumbnailLayoutMode) -> Self {
        self.layoutMode = mode;
        return self
    }
    @discardableResult
    public func byThumbnailSize(_ size: CGSize) -> Self {
        self.thumbnailSize = size;
        return self
    }
    @discardableResult
    public func byBackgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color;
        return self
    }
    @discardableResult
    public func byContentInset(_ inset: UIEdgeInsets) -> Self {
        if #available(iOS 11.0, *) {
            self.contentInset = inset
        }; return self
    }
}
