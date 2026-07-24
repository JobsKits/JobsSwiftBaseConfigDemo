//
//  JobsCopiedAppIconPhotoCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

final class JobsCopiedAppIconPhotoCell: UITableViewCell {
    private static let dateFormatter = DateFormatter().byDateFormat("yyyy-MM-dd HH:mm")

    private lazy var photoImageView: UIImageView = {
        UIImageView()
            .byBackgroundColor(JobsCor.tertiarySystemBackground)
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byCornerRadius(14)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .byAddTo(contentView) { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(16)
                make.size.equalTo(76)
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(1)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(18)
                make.left.equalTo(self.photoImageView.snp.right).offset(12)
                make.right.equalToSuperview().inset(42)
            }
    }()

    private lazy var detailLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
                make.left.right.equalTo(self.titleLabel)
            }
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.byBackgroundColor(JobsCor.secondarySystemBackground)
        photoImageView.byVisible(YES)
        titleLabel.byVisible(YES)
        detailLabel.byVisible(YES)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.byImage(nil)
        titleLabel.byText(nil)
        detailLabel.byText(nil)
        self.byAccessoryType(.none)
    }

    @discardableResult
    func byPhoto(_ photo: JobsCopiedAppIconPhoto,
                 image: UIImage?,
                 isCurrent: Bool) -> Self {
        photoImageView.byImage(image)
        titleLabel.byText(Self.dateFormatter.string(from: photo.createdAt))
        detailLabel.byText(
            "\(photo.pixelWidth) × \(photo.pixelHeight)" +
            (isCurrent ? " · 当前演示照片".tr : " · 点按切换演示照片".tr)
        )
        self.byAccessoryType(isCurrent ? .checkmark : .none)
        return self
    }
}
